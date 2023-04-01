Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116E2C7EE20
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.32134.1680384534524267084
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dVMFz46c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101873eb92efc-8843b16b-f128-4ecc-bf77-4a5ff55dbe32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t8INagQc/2v7/Ko3Y/NvLkTlHjNJjQbOL6YjD/L2/+E=;
	b=dVMFz46c65EWZjNC52ELZ0o5TCyFEaLErIhrf/ip/+mHCsQnq7w7dldAiVc5FpEJ
	ZXMOMZlfxJj7ZJrO3l7UnHFwNW3vrioogLF15DH//hSq7la+ir3dBeFZp/OZN5V5UVg
	QtzBzPH2XKzMRUy7hEPVJW5WengrRuKMuKAz1HUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t8INagQc/2v7/Ko3Y/NvLkTlHjNJjQbOL6YjD/L2/+E=;
	b=EvIiO7X5y72jtbaleTu4shBl2MPuB+0A8wnRfXw+g5saoVsrJHnpi4lBC/LolkOe
	SuzmN5tLtMHS12natftMud5dKn/q7ZjtJqp650Dsf3crkSF/bq3Yg7CJ6iwmgilvIMA
	Gl7K5DlomgZmBXFgR4/7ulAPAfXTVuXVH0xV2G/Y=
Content-Type: multipart/mixed; boundary="===============6358211033102297210=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.22.1 SUCCEEDED
Message-ID: <010101873eb92efc-8843b16b-f128-4ecc-bf77-4a5ff55dbe32-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179554

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.22.0-1.22.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fe4a18527b767e6e96337dd2d7825bae654e04c0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe4a18527b767e6e96337dd2d7825bae654e04c0"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 36 Mirrors 0 Missed 17 Current 570 (67% match, 97% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 590 of 623 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1689 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: Running task 1772 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_fetch)
NOTE: Running task 1819 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1903 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1904 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: Running task 1905 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_unpack)
NOTE: Running task 1938 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_write_config)
NOTE: Running task 2122 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: Running task 2124 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2125 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2126 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic unihash changed to acc2f92f6673c77452051aeb5818c26b8498e63ea91989d036ae99676987a7df
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2127 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2128 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2129 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2130 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to efb4de3e5edb71ef4b5f21815c105f9ad6fd71806381ecd2a1e5cf14fe4aafc3
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2144 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7994dc0197a3d7f2ae99e629c620e5b799d87ecde32071472b49df20689399c2
NOTE: Running task 2152 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2153 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_compile)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2154 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Succeeded
NOTE: Running task 2155 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_package)
NOTE: Running task 2156 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2157 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Succeeded
NOTE: Running task 2159 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2159 tasks of which 2133 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pygobject/3.42.2-r0/temp/log.do_packagedata.3537535
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata) failed with exit code '1'

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.1.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-python: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: PV changed from "1.22.0" to "1.22.1"

--===============6358211033102297210==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.22.0-1.22.1.patch"

RnJvbSA3NmY2YjYzZDEyMDE5YmUyNjZkYzI4ZTRhMzc3YzFmOTUwYTBhMDQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxOTo0MTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMQoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yMi4wLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yMi4xLmJifSAoOTAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuMS5iYgppbmRleCA2ZGY4NGE2MjUxLi5lM2JjMDJhNDc5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yMi4xLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzYzYWQzNjRjYTQ2MTdlYjJjYmIzOTc1
YWIyNmM2Njc2MGViM2M3YTZhZGY1YmU2OWY5OWMxMWUyMWVmM2E1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjk2MDA4YTQ0MWQ2ODVhNjQyNzVhNTE1Yjg5M2NjYWQwZmVhMWQ1NjBjNDNhY2QwNzYz
NTMzZTE3ZjNhMTNlYmIiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAiZ3N0cmVh
bWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCi0tIAoy
LjM5LjIKCg==

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1797 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1797 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fe4a18527b767e6e96337dd2d7825bae654e04c0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe4a18527b767e6e96337dd2d7825bae654e04c0"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 36 Mirrors 0 Missed 17 Current 574 (67% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 594 of 627 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1695 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: Running task 1790 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_fetch)
NOTE: Running task 1837 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1920 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1921 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: Running task 1922 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_unpack)
NOTE: Running task 1956 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_write_config)
NOTE: Running task 2140 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2141 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: Running task 2142 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2144 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic unihash changed to acc2f92f6673c77452051aeb5818c26b8498e63ea91989d036ae99676987a7df
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2145 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2146 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2147 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2148 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_configure)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3f9758a130d251c4880c63445a0160f24cd01b584f5b00ca41aa64418c0cb3f5
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2162 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 36deaa96c352f3b0c6063b0341b3a10810745556a80ce4a4680e35c33ecc2227
NOTE: Running task 2170 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2171 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_compile)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2172 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_package)
NOTE: Running task 2174 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2175 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2176 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Succeeded
NOTE: Running task 2177 of 2186 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2177 tasks of which 2151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pygobject/3.42.2-r0/temp/log.do_packagedata.3503728
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata) failed with exit code '1'

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 50 skipped, 0 masked, 0 errors.
Removing 78 recipes from the core2-32 sysroot...done.
Removing 97 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fe4a18527b767e6e96337dd2d7825bae654e04c0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe4a18527b767e6e96337dd2d7825bae654e04c0"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 395 Local 378 Mirrors 0 Missed 17 Current 186 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 187 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 191 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 833 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: Running task 853 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 862 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 867 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_write_config)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 234 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: Running task 927 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 246 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_patch)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 259 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: Running task 950 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 951 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 956 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 957 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 962 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 963 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic unihash changed to acc2f92f6673c77452051aeb5818c26b8498e63ea91989d036ae99676987a7df
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 271 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 976 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 978 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 983 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 984 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 985 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 277 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 287 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 346 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 358 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 380 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 390 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1101 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 399 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 422 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4fad8b7554539667ce2afee5751d0311916de63fc4ed5f22dafc5460023d6d50
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 581 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1895 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2012 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_write_rpm)
NOTE: Running task 2013 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_configure)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2016 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_compile)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2017 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_package)
NOTE: Running task 2019 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2020 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2021 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2031 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2022 tasks of which 1991 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pygobject/3.42.2-r0/temp/log.do_packagedata.3561393
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata) failed with exit code '1'

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fe4a18527b767e6e96337dd2d7825bae654e04c0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe4a18527b767e6e96337dd2d7825bae654e04c0"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 36 Mirrors 0 Missed 17 Current 560 (67% match, 97% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 580 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1682 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: Running task 1754 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_fetch)
NOTE: Running task 1791 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1871 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1872 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: Running task 1873 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1874 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_unpack)
NOTE: Running task 1906 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_write_config)
NOTE: Running task 2086 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: Running task 2088 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2090 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic unihash changed to acc2f92f6673c77452051aeb5818c26b8498e63ea91989d036ae99676987a7df
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2092 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2093 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2094 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_configure)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 06b3a116c47dae76b8eab0061a456db7df96bbc7985c500b5d34946249a414a8
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2108 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f72d0fa918541ffac38106c61c0e1fbcf619abfac616beca13b0c759dc5962a5
NOTE: Running task 2115 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_compile)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Succeeded
NOTE: Running task 2119 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_package)
NOTE: Running task 2120 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2121 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2122 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2123 tasks of which 2097 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pygobject/3.42.2-r0/temp/log.do_packagedata.3526262
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata) failed with exit code '1'

--===============6358211033102297210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 56 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fe4a18527b767e6e96337dd2d7825bae654e04c0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe4a18527b767e6e96337dd2d7825bae654e04c0"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 36 Mirrors 0 Missed 17 Current 570 (67% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 590 of 623 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1689 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: Running task 1772 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_fetch)
NOTE: Running task 1819 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1903 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1904 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: Running task 1905 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_unpack)
NOTE: Running task 1938 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_write_config)
NOTE: Running task 2122 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: Running task 2124 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2125 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2126 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_populate_lic unihash changed to acc2f92f6673c77452051aeb5818c26b8498e63ea91989d036ae99676987a7df
NOTE: Running task 2127 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2128 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2129 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2130 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_configure)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6ac183ca786c18657042ded50663fea0f9f2566d1d4c36d6b880e26722f9c86c
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2144 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ee640553c9ed7531eb4120f495a1c27eae33b911eb232233bf76a7c935b60339
NOTE: Running task 2151 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2153 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_compile)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2154 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_install)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_install: Succeeded
NOTE: Running task 2155 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_package)
NOTE: Running task 2156 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2157 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_package: Succeeded
NOTE: Running task 2159 of 2168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-python-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2159 tasks of which 2133 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.44.1-r0 to 0:3.42.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.42.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pygobject/3.42.2-r0/temp/log.do_packagedata.3515002
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_packagedata) failed with exit code '1'

--===============6358211033102297210==--

