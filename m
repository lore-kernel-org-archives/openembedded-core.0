Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A28C6FA8E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.857.1667349635100827342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LTL7y6xu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c863f0-d61ab0dd-0a16-4e34-a756-ecb8ab31a77a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cijOBbJrOQmetvoHoF7vAG6lq1+RMncfH79DGfqy50c=;
	b=LTL7y6xuJO98zcBd0oWy667jjul5CQ6aZ1fUy1mefxGh+svpW+xWLxWF0epKAucV
	mq/79orpu8Wnr5reFgzQRfJnp9vx+6ifKSgxnUN31tNZ9/qBAzOMX8T1Z3PvivihHNj
	vb9DlT2GXeXpF/gSEq9WPEWQsjGn/nkPVQZ4uxBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cijOBbJrOQmetvoHoF7vAG6lq1+RMncfH79DGfqy50c=;
	b=RMQKjWRvUlYIK57gkFzcDt1uP8SFyInZFM2uhXog9U1UW8lh9KohJtz9TLmxM6ZK
	RzjgNKHzNXdw1zzK4BLfEYeDmp+wTtqne+62BAj3tWq1+eG7CzyPxd4aKAD+VkQnHAD
	hIcJWHp7HOIeskkXhZke/hkBHO6kv4gOcozKkZws=
Content-Type: multipart/mixed; boundary="===============3915429028372301155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.20.4 SUCCEEDED
Message-ID: <0101018435c863f0-d61ab0dd-0a16-4e34-a756-ecb8ab31a77a-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172508

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.20.3-1.20.4.patch
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
--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 721016 to 721108 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 487407 to 487950 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz file://0001-libav-Fix-for-APNG-encoder-property-registration.patch" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.4.tar.xz"

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2b80ba86235a3991e1fc808a3029f8e8a09ab3a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 472 (51% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running task 1613 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: Running task 1640 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_compile_ptest_base)
NOTE: Running task 1641 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1681 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1767 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1772 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1774 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1775 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1776 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: Running task 1777 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_install: Started
NOTE: Running task 1779 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to 18e2378a91e1862f03eb17faca8e21cb929510d2c77605431bd7647294bb36ff
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1782 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1785 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1786 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_package)
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_package: Started
NOTE: Running task 1787 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata)
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1791 tasks of which 1766 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.10-r0/temp/log.do_packagedata.2890462
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata) failed with exit code '1'

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 76 recipes from the core2-32 sysroot...done.
Removing 76 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2b80ba86235a3991e1fc808a3029f8e8a09ab3a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 335 Local 315 Mirrors 0 Missed 20 Current 179 (94% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 193 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 207 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 214 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 215 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 812 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 813 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_write_config)
NOTE: Running task 824 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 841 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 855 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 857 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: Running task 859 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe pango-1.50.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_fetch)
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 861 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 237 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 862 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 863 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 243 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_fetch: Started
NOTE: recipe pango-1.50.10-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 255 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 891 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 905 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 906 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_unpack: Started
NOTE: Running task 907 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 263 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 917 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 918 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 927 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running task 928 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 933 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_patch: Started
NOTE: Running setscene task 287 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 289 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to 18e2378a91e1862f03eb17faca8e21cb929510d2c77605431bd7647294bb36ff
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running setscene task 295 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 957 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.10-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 975 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 322 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 326 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 373 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 376 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 399 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1607 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1752 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1773 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: Running task 1774 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1775 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_configure)
NOTE: recipe pango-1.50.10-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1777 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_compile)
NOTE: recipe pango-1.50.10-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1778 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1779 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.10-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_compile_ptest_base)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1781 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: Running task 1782 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1784 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe pango-1.50.10-r0: task do_install: Succeeded
NOTE: Running task 1785 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1786 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: Running task 1787 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1789 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1792 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_package: Succeeded
NOTE: Running task 1793 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata)
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1793 tasks of which 1747 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.10-r0/temp/log.do_packagedata.3575752
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata) failed with exit code '1'

--===============3915429028372301155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.20.3-1.20.4.patch"

RnJvbSBjNDBhM2E1YzlmYmNkYmU3MjhhMjY4NThhZjY2NTU1MGRhMjVmM2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxOTo0Mzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIwLjMgLT4gMS4yMC40CgotLS0KIC4uLnItQVBO
Ry1lbmNvZGVyLXByb3BlcnR5LXJlZ2lzdHJhdGlvbi5wYXRjaCB8IDg2IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLjEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMC40LmJifSB8ICA2
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdi8wMDAxLWxpYmF2LUZpeC1mb3ItQVBORy1lbmNvZGVyLXByb3BlcnR5LXJl
Z2lzdHJhdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci97Z3N0cmVhbWVyMS4wLWxpYmF2XzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4y
MC40LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtbGliYXYvMDAwMS1saWJhdi1GaXgtZm9yLUFQTkctZW5jb2Rlci1w
cm9wZXJ0eS1yZWdpc3RyYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2LzAwMDEtbGliYXYtRml4LWZvci1BUE5HLWVuY29kZXIt
cHJvcGVydHktcmVnaXN0cmF0aW9uLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA1MjZiYmIwMDM3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXYvMDAwMS1saWJhdi1GaXgtZm9yLUFQTkctZW5jb2Rl
ci1wcm9wZXJ0eS1yZWdpc3RyYXRpb24ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw4NiArMCww
IEBACi1Gcm9tIDc4YTk3YzFlYzM1YWRhNzZkODNmYzY3ZDA1NDliYTU2Yzc0ZDg4NzUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBTZXVuZ2hhIFlhbmcgPHNldW5naGFAY2VudHJpY3Vs
YXIuY29tPgotRGF0ZTogVGh1LCA3IEp1bCAyMDIyIDIyOjE2OjMwICswOTAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGxpYmF2OiBGaXggZm9yIEFQTkcgZW5jb2RlciBwcm9wZXJ0eSByZWdpc3RyYXRpb24K
LQotVGhlIEFWQ2xhc3MgbmFtZSBvZiBBbmltYXRlZCBQTkcgaW4gRkZtcGVnIDUueCBpcyAiKEEp
UE5HIgotYW5kIGl0IHdpbGwgYmUgY29udmVydGVkIHRvICItYS1wbmciIHRocm91Z2gKLWdfYXNj
aWlfc3RyZG93bigpIGFuZCBnX3N0cmNhbm9uKCkuIEJ1dCBHTGliIGRpc2FsbG93IGxlYWRpbmcg
Jy0nCi1jaGFyYWN0ZXIgZm9yIGEgR1R5cGUgbmFtZS4gU3RyaXAgbGVhZGluZyAnLScgdG8gd29y
a2Fyb3VuZCBpdC4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvLS9tZXJnZV9yZXF1ZXN0cy8yNzI0
XQotCi1TZXVuZ2hhIFlhbmdzIHBhdGNoIHdhcyBpbXBvcnRlZCB3aXRob3V0IG1vZGlmaWNhdGlv
bnMuCi0KLVNpZ25lZC1vZmYtYnk6IENsYXVzIFN0b3ZnYWFyZCA8Y2xhdXMuc3RvdmdhYXJkQGdt
YWlsLmNvbT4KLS0tLQotIGV4dC9saWJhdi9nc3RhdmNmZy5jIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2V4dC9saWJhdi9nc3RhdmNmZy5jIGIvZXh0L2xpYmF2
L2dzdGF2Y2ZnLmMKLWluZGV4IGM3MzY5MjAuLmE4NjM1YTcgMTAwNjQ0Ci0tLS0gYS9leHQvbGli
YXYvZ3N0YXZjZmcuYwotKysrIGIvZXh0L2xpYmF2L2dzdGF2Y2ZnLmMKLUBAIC05MSwxMCArOTEs
MTkgQEAgcmVnaXN0ZXJfZW51bSAoY29uc3QgQVZDbGFzcyAqKiBvYmosIGNvbnN0IEFWT3B0aW9u
ICogdG9wX29wdCkKLSAgIGdjaGFyICpsb3dlcl9vYmpfbmFtZSA9IGdfYXNjaWlfc3RyZG93biAo
KCpvYmopLT5jbGFzc19uYW1lLCAtMSk7Ci0gICBnY2hhciAqZW51bV9uYW1lID0gZ19zdHJkdXBf
cHJpbnRmICgiJXMtJXMiLCBsb3dlcl9vYmpfbmFtZSwgdG9wX29wdC0+dW5pdCk7Ci0gICBnYm9v
bGVhbiBub25lX2RlZmF1bHQgPSBUUlVFOwotKyAgY29uc3QgZ2NoYXIgKmVudW1fbmFtZV9zdHJp
cDsKLSAKLSAgIGdfc3RyY2Fub24gKGVudW1fbmFtZSwgR19DU0VUX2FfMl96IEdfQ1NFVF9ESUdJ
VFMsICctJyk7Ci0gCi0tICBpZiAoKHJlcyA9IGdfdHlwZV9mcm9tX25hbWUgKGVudW1fbmFtZSkp
KQotKyAgLyogc3RyaXAgbGVhZGluZyAnLSdzICovCi0rICBlbnVtX25hbWVfc3RyaXAgPSBlbnVt
X25hbWU7Ci0rICB3aGlsZSAoZW51bV9uYW1lX3N0cmlwWzBdID09ICctJykKLSsgICAgZW51bV9u
YW1lX3N0cmlwKys7Ci0rCi0rICBpZiAoZW51bV9uYW1lX3N0cmlwWzBdID09ICdcMCcpCi0rICAg
IGdvdG8gZG9uZTsKLSsKLSsgIGlmICgocmVzID0gZ190eXBlX2Zyb21fbmFtZSAoZW51bV9uYW1l
X3N0cmlwKSkpCi0gICAgIGdvdG8gZG9uZTsKLSAKLSAgIHdoaWxlICgob3B0ID0gYXZfb3B0X25l
eHQgKG9iaiwgb3B0KSkpIHsKLUBAIC0xNTAsOSArMTU5LDggQEAgcmVnaXN0ZXJfZW51bSAoY29u
c3QgQVZDbGFzcyAqKiBvYmosIGNvbnN0IEFWT3B0aW9uICogdG9wX29wdCkKLSAgICAgICB9Ci0g
ICAgIH0KLSAKLS0gICAgcmVzID0KLS0gICAgICAgIGdfZW51bV9yZWdpc3Rlcl9zdGF0aWMgKGVu
dW1fbmFtZSwgJmdfYXJyYXlfaW5kZXggKHZhbHVlcywgR0VudW1WYWx1ZSwKLS0gICAgICAgICAg
ICAwKSk7Ci0rICAgIHJlcyA9IGdfZW51bV9yZWdpc3Rlcl9zdGF0aWMgKGVudW1fbmFtZV9zdHJp
cCwKLSsgICAgICAgICZnX2FycmF5X2luZGV4ICh2YWx1ZXMsIEdFbnVtVmFsdWUsIDApKTsKLSAK
LSAgICAgZ3N0X3R5cGVfbWFya19hc19wbHVnaW5fYXBpIChyZXMsIDApOwotICAgfQotQEAgLTE3
NywxMCArMTg1LDE5IEBAIHJlZ2lzdGVyX2ZsYWdzIChjb25zdCBBVkNsYXNzICoqIG9iaiwgY29u
c3QgQVZPcHRpb24gKiB0b3Bfb3B0KQotICAgR0FycmF5ICp2YWx1ZXMgPSBnX2FycmF5X25ldyAo
VFJVRSwgVFJVRSwgc2l6ZW9mIChHRW51bVZhbHVlKSk7Ci0gICBnY2hhciAqbG93ZXJfb2JqX25h
bWUgPSBnX2FzY2lpX3N0cmRvd24gKCgqb2JqKS0+Y2xhc3NfbmFtZSwgLTEpOwotICAgZ2NoYXIg
KmZsYWdzX25hbWUgPSBnX3N0cmR1cF9wcmludGYgKCIlcy0lcyIsIGxvd2VyX29ial9uYW1lLCB0
b3Bfb3B0LT51bml0KTsKLSsgIGNvbnN0IGdjaGFyICpmbGFnc19uYW1lX3N0cmlwOwotIAotICAg
Z19zdHJjYW5vbiAoZmxhZ3NfbmFtZSwgR19DU0VUX2FfMl96IEdfQ1NFVF9ESUdJVFMsICctJyk7
Ci0gCi0tICBpZiAoKHJlcyA9IGdfdHlwZV9mcm9tX25hbWUgKGZsYWdzX25hbWUpKSkKLSsgIC8q
IHN0cmlwIGxlYWRpbmcgJy0ncyAqLwotKyAgZmxhZ3NfbmFtZV9zdHJpcCA9IGZsYWdzX25hbWU7
Ci0rICB3aGlsZSAoZmxhZ3NfbmFtZV9zdHJpcFswXSA9PSAnLScpCi0rICAgIGZsYWdzX25hbWVf
c3RyaXArKzsKLSsKLSsgIGlmIChmbGFnc19uYW1lX3N0cmlwWzBdID09ICdcMCcpCi0rICAgIGdv
dG8gZG9uZTsKLSsKLSsgIGlmICgocmVzID0gZ190eXBlX2Zyb21fbmFtZSAoZmxhZ3NfbmFtZV9z
dHJpcCkpKQotICAgICBnb3RvIGRvbmU7Ci0gCi0gICB3aGlsZSAoKG9wdCA9IGF2X29wdF9uZXh0
IChvYmosIG9wdCkpKSB7Ci1AQCAtMjExLDcgKzIyOCw3IEBAIHJlZ2lzdGVyX2ZsYWdzIChjb25z
dCBBVkNsYXNzICoqIG9iaiwgY29uc3QgQVZPcHRpb24gKiB0b3Bfb3B0KQotICAgICBnX2FycmF5
X3NvcnQgKHZhbHVlcywgKEdDb21wYXJlRnVuYykgY21wX2ZsYWdzX3ZhbHVlKTsKLSAKLSAgICAg
cmVzID0KLS0gICAgICAgIGdfZmxhZ3NfcmVnaXN0ZXJfc3RhdGljIChmbGFnc19uYW1lLCAmZ19h
cnJheV9pbmRleCAodmFsdWVzLAotKyAgICAgICAgZ19mbGFnc19yZWdpc3Rlcl9zdGF0aWMgKGZs
YWdzX25hbWVfc3RyaXAsICZnX2FycmF5X2luZGV4ICh2YWx1ZXMsCi0gICAgICAgICAgICAgR0Zs
YWdzVmFsdWUsIDApKTsKLSAKLSAgICAgZ3N0X3R5cGVfbWFya19hc19wbHVnaW5fYXBpIChyZXMs
IDApOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdl8xLjIwLjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjAuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1saWJhdl8xLjIwLjQuYmIKaW5kZXggN2EyYzBkMTM2NS4uZTIzY2YyZTMz
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjIwLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjIwLjQuYmIKQEAgLTExLDEwICsxMSw4IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2
MTI5ZjdhNzcwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2V4dC9saWJhdi9nc3Rhdi5o
O2JlZ2lubGluZT0xO2VuZGxpbmU9MTg7bWQ1PWE3NTJjMzUyNjdkODI3NmZkOWNhM2RiNjk5NGZj
YTljIFwKICAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVh
bWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHog
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJhdi1GaXgtZm9yLUFQTkctZW5jb2Rlci1wcm9w
ZXJ0eS1yZWdpc3RyYXRpb24ucGF0Y2ggXAotICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiM2ZlZGQxMDU2MGZjZGZhYTFiNjQ2MmNiZjc5YTM4YzRlN2I1N2Q3ZjM5MDM1OTM5M2Zj
MGNlZjZkYmYyN2RmZSIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwNGNjYmRkNThmYjMxZGQ5NDA5OGRhNTk5MjA5ODM0YTBlNzY2MTYzOGM1NzAzMzgx
ZGQwYTg2MmM1NmZjNTMyIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0t
IAoyLjMxLjEKCg==

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2b80ba86235a3991e1fc808a3029f8e8a09ab3a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 21 Mirrors 0 Missed 15 Current 471 (58% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 490 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running task 1639 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1678 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1737 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: Running task 1745 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: Running task 1758 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: Running task 1762 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: Running task 1763 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1764 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1766 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1767 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1768 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to 18e2378a91e1862f03eb17faca8e21cb929510d2c77605431bd7647294bb36ff
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1770 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1771 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1774 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1775 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1776 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1780 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1781 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1782 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata)
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1785 tasks of which 1757 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-src went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-dbg went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libavcodec went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libavdevice went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libavfilter went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libavformat went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libavutil went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libpostproc went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libswresample went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package libswscale went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-staticdev went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-dev went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-doc went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg-locale went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: QA Issue: Package version for package ffmpeg went backwards which would break package feeds (from 0:5.1.2-r0 to 0:5.1.1-r0) [version-going-backwards]
ERROR: ffmpeg-5.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ffmpeg/5.1.1-r0/temp/log.do_packagedata.3157937
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2b80ba86235a3991e1fc808a3029f8e8a09ab3a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 472 (51% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running task 1613 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: Running task 1640 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_compile_ptest_base)
NOTE: Running task 1642 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1681 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1767 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1772 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1773 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1774 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: Running task 1776 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1779 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1780 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1782 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to 18e2378a91e1862f03eb17faca8e21cb929510d2c77605431bd7647294bb36ff
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Started
NOTE: Running task 1784 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1785 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot)
NOTE: Running task 1786 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_package: Started
NOTE: Running task 1787 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata)
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1791 tasks of which 1766 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.10-r0/temp/log.do_packagedata.3277694
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata) failed with exit code '1'

--===============3915429028372301155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2b80ba86235a3991e1fc808a3029f8e8a09ab3a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 20 Mirrors 0 Missed 20 Current 473 (50% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running task 1619 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: Running task 1644 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_compile_ptest_base)
NOTE: Running task 1646 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1693 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1767 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1771 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: Running task 1772 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1773 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1774 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1775 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1776 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: Running task 1777 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: Running task 1779 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to 18e2378a91e1862f03eb17faca8e21cb929510d2c77605431bd7647294bb36ff
NOTE: Running task 1782 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1785 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot)
NOTE: Running task 1786 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_package: Started
NOTE: Running task 1787 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.10-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata)
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1791 tasks of which 1766 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.11-r0 to 0:1.50.10-r0) [version-going-backwards]
ERROR: pango-1.50.10-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.10-r0/temp/log.do_packagedata.2833119
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata) failed with exit code '1'

--===============3915429028372301155==--

