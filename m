Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99B8C3527D
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.10406.1647349734994305275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=4eVNpQvs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21f2a-f4843917-1986-46c8-a96f-3d7ac321b402-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YlP2C5Cvh6B0FRcGBIyRX28K4HzTsnuD1awTIrdJpF0=;
	b=4eVNpQvs2RaziVZ5/8JZ3r5qH3/5h3P3IcoF3SKTXq6exXD+mI+bJgDyk8KmwLaU
	S0508MVPVnxpSWxbkl7zXT3YXlfqcwpJ/JMzKpc2NyL7LR98Kdvtt6nBRmJbEiiL7jb
	90LrthXHB5MXh+oBoXcANlAZl0qdQZ3jYZMZME7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YlP2C5Cvh6B0FRcGBIyRX28K4HzTsnuD1awTIrdJpF0=;
	b=a7/oKfswotyOy7Du2ssb9qqFdzv9qDcMlWwF/2uOxTBj2pfeKMxp6dPCHHg4ahhu
	NdveRIuEyvOV+3MOjM70RnD2hhcpkaC9LRj6CzYhjqWykIYaiB55wmJYMKtt9ouYXis
	jx+4r8ccpwg6UAnZXD5ngZsJjaLcrRmka7QKyrSg=
Content-Type: multipart/mixed; boundary="===============8793599672011756074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.20.1 SUCCEEDED
Message-ID: 
 <0101017f8db21f2a-f4843917-1986-46c8-a96f-3d7ac321b402-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163271

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.20.0-1.20.1.patch
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
--===============8793599672011756074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.20.0-1.20.1.patch"

From e9722ad8a572c6b4cf830dd0e638ec01c1a63722 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 11:01:05 +0000
Subject: [PATCH] gst-devtools: upgrade 1.20.0 -> 1.20.1

---
 .../{gst-devtools_1.20.0.bb => gst-devtools_1.20.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.0.bb => gst-devtools_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
index e17f4ee09d..ade7cb7dc3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d"
+SRC_URI[sha256sum] = "81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.27.0


--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2000.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2000.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2001.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2001.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 887727 to 887750 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2000.0 /usr/lib/libgstvalidate-1.0.so.0.2000.0", added "/usr/lib/libgstvalidate-1.0.so.0.2001.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2001.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.0.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.1.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2000.0 to libgstvalidate-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2000.0 to libgstvalidate-default-overrides-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-1.0.so.0.2000.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2000.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2001.0

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 10 Mirrors 0 Missed 53 Current 534 (15% match, 91% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 561 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3101755
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1258 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1507 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1664 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1683 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1690 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1728 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1755 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1757 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1758 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1759 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1760 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1777 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1780 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1798 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_fetch)
NOTE: Running task 1819 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1843 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: Running task 1855 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1873 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: Running task 1889 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1890 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1891 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: Running task 1892 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: Running task 1893 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1894 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1895 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1896 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1897 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1898 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 1900 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1901 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: Running task 1902 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1903 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: Running task 1904 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_unpack)
NOTE: Running task 1905 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1906 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1907 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1908 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 1910 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1911 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1912 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1913 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: Running task 1914 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1915 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 1916 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: Running task 1917 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1918 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: Running task 1919 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: Running task 1920 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1921 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 1922 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1923 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: Running task 1924 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1925 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1926 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic)
NOTE: Running task 1927 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1928 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Started
NOTE: Running task 1930 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 1931 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1932 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1933 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic unihash changed to a0048b5874014eecafaa8ac7839bfcf13638a1ded7b483f4ee176657d29818dd
NOTE: Setscene tasks completed
NOTE: Running task 1939 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1940 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1941 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 1942 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1943 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1944 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1945 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: Running task 1974 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1982 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1989 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d25d3c26c678c93d22c45641c2dcd551821a8aa1afdac7a764ed3ac034eb65e6
NOTE: Running task 2003 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: Running task 2004 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2005 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2006 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2007 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 2009 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2010 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2011 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2014 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2015 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2016 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2017 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2019 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2020 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2021 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2022 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2027 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2029 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2030 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2031 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2032 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2033 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2034 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2039 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2040 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2042 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2043 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2044 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2045 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2048 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: Running task 2049 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2050 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2051 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2052 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2057 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2058 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2062 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2063 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2064 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2066 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2068 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2070 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2071 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2072 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 2073 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2074 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2075 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package_write_rpm)
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2076 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_compile)
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2077 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2078 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_install)
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package)
NOTE: Running task 2080 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2081 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2082 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_write_rpm)
NOTE: Running task 2083 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2084 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2084 tasks of which 1930 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 10 Mirrors 0 Missed 49 Current 524 (16% match, 91% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 549 of 583 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 583 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 583 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3755324
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 582 of 583 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1248 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1495 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1652 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1671 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1678 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1716 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1739 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1740 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1741 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1743 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1755 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1759 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1774 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_fetch)
NOTE: Running task 1806 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: Running task 1811 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1829 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 1846 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1847 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1848 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: Running task 1849 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1850 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1851 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1852 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1853 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: Running task 1854 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 1855 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_unpack)
NOTE: Running task 1856 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1857 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: Running task 1858 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1859 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1860 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1862 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1863 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 1866 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_patch)
NOTE: Running task 1867 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 1868 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: Running task 1869 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Started
NOTE: Running task 1870 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: Running task 1871 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: Running task 1875 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1879 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1881 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 1882 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1883 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: Running task 1884 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1885 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1886 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic unihash changed to a0048b5874014eecafaa8ac7839bfcf13638a1ded7b483f4ee176657d29818dd
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: Running task 1892 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: Running task 1894 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1895 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1924 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1932 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1939 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1940 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3d10e13db30fbd57f74e3cdf7abcd55c19a02df807945b0d76c501e33b62027f
NOTE: Running task 1954 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: Running task 1956 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1958 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1960 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1961 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1962 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1963 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1965 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1969 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1970 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1971 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1972 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1973 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1974 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1975 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1976 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: Running task 1977 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1978 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1979 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 1981 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1982 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1983 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1985 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1986 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1987 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1988 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: Running task 1989 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 1994 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 1995 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 1996 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1997 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2000 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2002 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2003 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2005 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2007 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2010 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2012 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 2014 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2015 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2017 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2018 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2019 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2021 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package_write_rpm)
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2022 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_compile)
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_install)
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package)
NOTE: Running task 2026 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2028 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_write_rpm)
NOTE: Running task 2029 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2030 of 2030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2030 tasks of which 1888 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 10 Mirrors 0 Missed 53 Current 530 (15% match, 91% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 557 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3841969
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1259 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1507 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1664 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1683 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1690 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1728 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1753 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1755 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1756 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1757 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1758 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1771 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1775 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1792 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_fetch)
NOTE: Running task 1798 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1825 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: Running task 1837 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1855 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1874 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1875 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1876 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1877 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: Running task 1878 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1879 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1880 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Started
NOTE: Running task 1881 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: Running task 1882 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1883 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 1884 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: Running task 1886 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_unpack)
NOTE: Running task 1887 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: Running task 1888 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1889 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 1890 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1891 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: Running task 1892 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_patch)
NOTE: Running task 1894 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1895 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 1896 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: Running task 1899 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: Running task 1901 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1903 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1904 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1905 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: Running task 1906 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1907 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1909 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Started
NOTE: Running task 1911 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1912 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1918 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1919 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1920 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic unihash changed to a0048b5874014eecafaa8ac7839bfcf13638a1ded7b483f4ee176657d29818dd
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 1922 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1923 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1924 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1925 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: Running task 1926 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1955 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1963 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1970 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1971 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef4803d6d46aaa652317dde5016660c3c9bfb4f26fb5b82a00119f969712810f
NOTE: Running task 1985 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: Running task 1987 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1989 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1990 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1991 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1994 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1995 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1996 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1997 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1999 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2000 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2001 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2002 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 2003 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2005 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2006 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2007 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2010 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2011 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2016 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2017 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2018 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2019 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2022 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2023 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2024 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2025 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2029 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2030 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: Running task 2032 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2033 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2036 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2038 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2039 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2044 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package_write_rpm)
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_compile)
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_install)
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 1912 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2000.0 /usr/lib/libgstvalidate-1.0.so.0.2000.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2001.0 /usr/lib/libgstvalidate-1.0.so.0.2001.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2000.0 to libgstvalidate-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2000.0 to libgstvalidate-default-overrides-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-1.0.so.0.2000.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2001.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2000.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2001.0

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 10 Mirrors 0 Missed 53 Current 530 (15% match, 91% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 557 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3428516
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: Running task 1260 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1507 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1664 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1683 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1690 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1728 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1753 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1754 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1755 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1756 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1757 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1771 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1774 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1792 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_fetch)
NOTE: Running task 1799 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1825 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: Running task 1837 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1855 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1871 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: Running task 1872 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 1873 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Started
NOTE: Running task 1874 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1875 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1876 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Started
NOTE: Running task 1877 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1878 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1879 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: Running task 1880 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1881 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1882 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1883 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 1884 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: Running task 1885 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_unpack)
NOTE: Running task 1886 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1887 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1888 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1890 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 1891 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 1895 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 1896 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1897 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1898 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: Running task 1899 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1901 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1903 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: Running task 1904 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1905 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1907 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1908 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1909 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic)
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: Running task 1910 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1911 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1913 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1914 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: Running task 1915 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1916 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1917 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic unihash changed to a0048b5874014eecafaa8ac7839bfcf13638a1ded7b483f4ee176657d29818dd
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1921 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1924 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 1925 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: Running task 1926 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1927 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1956 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1964 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1971 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9b074ab49bf314dbb0b484132f7ef5d7b9a473bb3d8de5b302c51a07269ab907
NOTE: Running task 1985 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1987 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1990 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1991 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1994 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1995 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1996 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1997 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1999 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2000 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2001 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2002 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 2006 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 2007 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: Running task 2011 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2016 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 2017 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2018 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2022 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2023 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2024 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Started
NOTE: Running task 2028 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2029 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2030 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: Running task 2033 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2034 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2036 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2037 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2039 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2040 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2044 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Started
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package_write_rpm)
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_compile)
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_install)
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 1912 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8793599672011756074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 93 recipes from the core2-32 sysroot...done.
Removing 98 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 364 Local 311 Mirrors 0 Missed 53 Current 190 (85% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 193 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 765 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 812 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 813 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 814 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 815 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 820 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 821 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 823 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 824 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 825 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 833 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 834 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 839 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_fetch)
NOTE: Running task 854 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 858 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: Running task 867 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 869 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Started
NOTE: Running task 871 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 873 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 874 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 876 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 877 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 878 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: Running task 879 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe gst-devtools-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 881 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_unpack)
NOTE: Running task 882 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: Running setscene task 257 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3923521
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 258 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Started
NOTE: Running setscene task 259 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 887 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 888 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 892 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 894 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 895 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 896 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 898 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_patch)
NOTE: Running task 905 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 263 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running task 906 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: Running task 907 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: Running task 908 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 909 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: Running task 910 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 911 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 912 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 913 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 914 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 265 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 918 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 920 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 921 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 922 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 923 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_lic unihash changed to a0048b5874014eecafaa8ac7839bfcf13638a1ded7b483f4ee176657d29818dd
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 268 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 308 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 333 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 337 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 367 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 398 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1054 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running task 1063 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1065 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 422 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 423 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1088 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 444 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 457 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running task 1102 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 474 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1143 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1176 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1198 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1219 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f4c1a74c88f81e9917b838289399c0e2c6cacc17e2178d79e7c58c9e0b287dfd
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1716 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1740 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1741 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1742 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1766 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1791 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1797 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1798 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 1823 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: Running task 1831 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1842 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: Running task 1850 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: Running task 1852 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1854 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1857 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1861 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1862 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1863 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1864 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1866 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1867 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1868 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1869 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 1871 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1875 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1876 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1877 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: Running task 1879 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1880 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1882 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1883 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 1884 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1885 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1887 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1888 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1889 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 1890 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1892 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1893 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1894 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Started
NOTE: Running task 1896 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 1897 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 1898 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 1899 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1900 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1902 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1903 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1904 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1905 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 1906 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 1909 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1912 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1915 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1917 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1919 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package_write_rpm)
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.35.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1921 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1922 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1923 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1924 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_configure)
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_compile)
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1926 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_install)
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package)
NOTE: Running task 1929 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 1930 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1931 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_write_rpm)
NOTE: Running task 1932 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1933 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1933 tasks of which 1773 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.5-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8793599672011756074==--

