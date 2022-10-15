Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2CBC4708D
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.24573.1665871397046648794
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FxPLrqwB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac3de8-04739e5f-3da3-453b-a082-b6db55be6de1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g70PJLwcff910mbf+QJM3z3kggIXL7eS34qDzWxggM8=;
	b=FxPLrqwBKMwnRjQtXr0YMRnJ8T5ao5cwcoesWS+CaW0Ame2rfoB5cZWgXoQzFsZP
	WPW3vVIyPmjMBcrn1ZBvqRYLB4WUQ36UYfTSSZsACHSxZlpiiUf5eDdBKMz9VuXdXrx
	UsaMxrIebMHuPW/pnO+dK3B3JdqYCKWQ5qY3U72Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g70PJLwcff910mbf+QJM3z3kggIXL7eS34qDzWxggM8=;
	b=Pfw6GnZDHDro7TJ8iGnTB+t3iKAcb+KD8PV9f7qm3hjONWf/06RdDw64pnJ8lpHf
	IrBsJmQoL3i2pj8rFe+6HycyiohnalUguKMLoW6bn9+Kk/qy+x7CyJkE0APjtTkNx3o
	rj+VhfqtaJqLdEVYfN9pFtGYQm44T/M30keCmctE=
Content-Type: multipart/mixed; boundary="===============6496930050116447828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3de8-04739e5f-3da3-453b-a082-b6db55be6de1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171827

--===============6496930050116447828==
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
--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1e357acdb4bc8f43112b2adaf33ddaac06a856a3"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 38 Mirrors 0 Missed 11 Current 464 (77% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1696 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1794 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to e6fea3806ed022ae07de3a0d0f6fd87fb3e838b064c1c25ec8937cac9e6deb8b
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1796 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1797 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1801 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1802 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata)
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1807 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ffmpeg/5.1.1-r0/temp/log.do_packagedata.1979035
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1e357acdb4bc8f43112b2adaf33ddaac06a856a3"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 38 Mirrors 0 Missed 11 Current 458 (77% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1638 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1678 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1760 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 1768 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1769 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1770 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1771 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1772 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to e6fea3806ed022ae07de3a0d0f6fd87fb3e838b064c1c25ec8937cac9e6deb8b
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1774 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1775 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
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
NOTE: Tasks Summary: Attempted 1785 tasks of which 1763 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ffmpeg/5.1.1-r0/temp/log.do_packagedata.2007504
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1e357acdb4bc8f43112b2adaf33ddaac06a856a3"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 38 Mirrors 0 Missed 11 Current 464 (77% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1643 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1684 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1794 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to e6fea3806ed022ae07de3a0d0f6fd87fb3e838b064c1c25ec8937cac9e6deb8b
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1796 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1797 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1801 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1802 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata)
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1807 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/ffmpeg/5.1.1-r0/temp/log.do_packagedata.2021543
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============6496930050116447828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.20.3-1.20.4.patch"

RnJvbSBiYzY2ZTJjZWI4OTljNjg1MmQwNWViYzhiNGU5NzVmZWEzNGZiMjE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTg6MDI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yMC4zIC0+IDEuMjAuNAoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjAuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjAuNC5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjAuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yMC4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjAuNC5iYgppbmRleCBlOGRhNDlhZjk5Li5lMjNjZjJlMzM3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjAuNC5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjNmZWRkMTA1NjBmY2RmYWExYjY0NjJjYmY3OWEzOGM0ZTdiNTdk
N2YzOTAzNTkzOTNmYzBjZWY2ZGJmMjdkZmUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDRjY2Jk
ZDU4ZmIzMWRkOTQwOThkYTU5OTIwOTgzNGEwZTc2NjE2MzhjNTcwMzM4MWRkMGE4NjJjNTZmYzUz
MiIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1e357acdb4bc8f43112b2adaf33ddaac06a856a3"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 38 Mirrors 0 Missed 11 Current 464 (77% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1643 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 1684 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1794 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to e6fea3806ed022ae07de3a0d0f6fd87fb3e838b064c1c25ec8937cac9e6deb8b
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1796 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1797 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1801 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1802 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata)
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1807 tasks of which 1785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ffmpeg/5.1.1-r0/temp/log.do_packagedata.1993477
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1e357acdb4bc8f43112b2adaf33ddaac06a856a3"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 346 Local 335 Mirrors 0 Missed 11 Current 168 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 180 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 822 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_fetch)
NOTE: Running task 839 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_fetch)
NOTE: Running task 854 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_unpack)
NOTE: Running task 857 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 207 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 215 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 864 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 865 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 229 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 244 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_lic unihash changed to e6fea3806ed022ae07de3a0d0f6fd87fb3e838b064c1c25ec8937cac9e6deb8b
NOTE: recipe ffmpeg-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 255 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 921 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 284 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 286 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 304 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 331 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 333 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 404 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 414 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 421 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 427 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 446 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 475 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1767 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1798 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_configure)
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1799 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_compile)
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1800 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_install)
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1801 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_package)
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1803 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1805 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1807 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1808 of 1813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata)
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-5.1.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1808 tasks of which 1786 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ffmpeg/5.1.1-r0/temp/log.do_packagedata.2047554
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb:do_packagedata) failed with exit code '1'

--===============6496930050116447828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 720840 to 721108 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 486989 to 487950 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.20.3" to "1.20.4"

--===============6496930050116447828==--

