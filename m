Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524DBC8302B
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.27784.1748786124066601956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QydN2N6e;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OUZm+vip;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6f939-b73c086b-f85b-489c-8bb2-caee827d7512-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2ZoHVuKBXdTeB4G2QphpI8semLrb27MixYkcqu2NM1k=;
	b=QydN2N6edon5DpQRaxtjul7qccHR6cxPjuSv/TipdXasiLKD4fIa7vOkPGAOnKcG
	0socSn1YWnRJ0aVvgC3rDQjtQX5BVCN4HAK9mY7+PS3P+W3IqHJQaF3D8LYmn3QArMJ
	LvVweT9hgak+A/HvsgNx3UBsg7ZTdks85Ez4BqcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2ZoHVuKBXdTeB4G2QphpI8semLrb27MixYkcqu2NM1k=;
	b=OUZm+vipH+PlKPpuZ3n9PUxZZo9RcqqWUsYOcSVgXGQtilknbDQue7kif5Mot9EP
	xIRWj6pdKuRyf+yawVENlgu0JTKJmc9Gc1GK4JVM4H84fD49GioNx8PPQg3vaFGgqLc
	AHIrEp0Uaqi8xvF0KpCkbOiEVDxw0WFA1F94/vVg=
Content-Type: multipart/mixed; boundary="===============1252267658217782225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.26.2 FAILED
Message-ID: <010101972bc6f939-b73c086b-f85b-489c-8bb2-caee827d7512-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217653

--===============1252267658217782225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.26.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.26.1-1.26.2.patch
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

-- >8 --
From 04aa5bb81cff6755129fff33b4d9aaa70478d55b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 12:35:45 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.26.1 -> 1.26.2

---
 ...reamer1.0-python_1.26.1.bb => gstreamer1.0-python_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.1.bb => gstreamer1.0-python_1.26.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
index 6afd286d38..50ff21c1ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2dce1ecc8a80ce8e0b6f0e0cb3fad3bcd5d65ebe0622ed28eaae97b4559a6a85"
+SRC_URI[sha256sum] = "757ae964c16a542d60708bcb8a67c56c5be83785c0d1c534b9b9366bf676746e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============1252267658217782225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:4816dd9421b8796570849ee0da3c2ddeedd4b3d0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 652 Local 640 Mirrors 0 Missed 12 Current 849 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3598 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_recipe_qa: Started
NOTE: Running task 3794 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4099 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_fetch: Succeeded
NOTE: Running task 4100 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_unpack)
NOTE: Running task 4101 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_unpack: Succeeded
NOTE: Running task 4102 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_patch)
NOTE: Running task 4103 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_patch: Succeeded
NOTE: Running task 4104 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 4105 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4106 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_configure: Succeeded
NOTE: Running task 4107 of 4118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_compile)
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/6] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot -Igi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p -Igi/overrides -I../gst-python-1.26.2/gi/overrides -I. -I../gst-python-1.26.2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/gstreamer-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/pytho
 n3.13 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/pygobject-3.0 -fvisibility=hidden -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -DHAVE_CONFIG_H -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/gst-python-1.26.2=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/build=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ gi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o -MF gi/overrides/_
 gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o.d -o gi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o -c ../gst-python-1.26.2/gi/overrides/gstmodule.c
| FAILED: gi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o
| x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot -Igi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p -Igi/overrides -I../gst-python-1.26.2/gi/overrides -I. -I../gst-python-1.26.2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/gstreamer-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/python3.13 
 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/pygobject-3.0 -fvisibility=hidden -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -DHAVE_CONFIG_H -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/gst-python-1.26.2=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/build=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ gi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o -MF gi/overrides/_gi_gst
 .cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o.d -o gi/overrides/_gi_gst.cpython-313-x86_64-linux-gnu.so.p/gstmodule.c.o -c ../gst-python-1.26.2/gi/overrides/gstmodule.c
| ../gst-python-1.26.2/gi/overrides/gstmodule.c: In function '_gst_structure_is_writable':
| ../gst-python-1.26.2/gi/overrides/gstmodule.c:1042:7: error: implicit declaration of function 'gst_structure_is_writable'; did you mean '_gst_structure_is_writable'? [-Wimplicit-function-declaration]
|  1042 |   if (gst_structure_is_writable (structure)) {
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |       _gst_structure_is_writable
| [2/6] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot -Igi/overrides/_gi_gst_analytics.cpython-313-x86_64-linux-gnu.so.p -Igi/overrides -I../gst-python-1.26.2/gi/overrides -I. -I../gst-python-1.26.2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/gstreamer-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/inc
 lude/python3.13 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/pygobject-3.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/orc-0.4 -fvisibility=hidden -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -DHAVE_CONFIG_H -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/gst-python-1.26.2=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/build=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python
 /1.26.2/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ gi/overrides/_gi_gst_analytics.cpython-313-x86_64-linux-gnu.so.p/gstanalyticsmodule.c.o -MF gi/overrides/_gi_gst_analytics.cpython-313-x86_64-linux-gnu.so.p/gstanalyticsmodule.c.o.d -o gi/overrides/_gi_gst_analytics.cpython-313-x86_64-linux-gnu.so.p/gstanalyticsmodule.c.o -c ../gst-python-1.26.2/gi/overrides/gstanalyticsmodule.c
| [3/6] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot -Iplugin/libgstpython.so.p -Iplugin -I../gst-python-1.26.2/plugin -I. -I../gst-python-1.26.2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/gstreamer-1.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/pygobject-3.0 -I/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot/usr/include/python3.13 -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -DHAVE_CONFIG_H -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/gst-python-1.26.2=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/build=/usr/src/debug/gstreamer1.0-python/1.26.2 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ plugin/libgstpython.so.p/gstpythonplugin.c.o -MF plugin/libgstpython.so.p/gstpythonplugin.c.o.d -o plugin/libgstpython.so.p/gstpythonplugin.c.o -c ..
 /gst-python-1.26.2/plugin/gstpythonplugin.c
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/run.do_compile.2870521:159 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/run.do_compile.2870521, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/run.do_compile.2870521, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/run.do_compile.2870521, line 170
NOTE: recipe gstreamer1.0-python-1.26.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 4107 tasks of which 4096 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601123527.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601123527.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/log.do_compile.2870521
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.26.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/run.do_compile.2870521' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-python/1.26.2/temp/log.do_compile.2870521
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb:do_compile) failed with exit code '1'

--===============1252267658217782225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.26.1-1.26.2.patch"

RnJvbSAwNGFhNWJiODFjZmY2NzU1MTI5ZmZmMzNiNGQ5YWFhNzA0NzhkNTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMjozNTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yNi4xIC0+IDEuMjYuMgoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjYuMS5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjYuMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yNi4xLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNi4yLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjYuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjI2LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjYuMi5iYgppbmRleCA2YWZkMjg2ZDM4Li41MGZmMjFjMWVmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNi4yLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZGNlMWVjYzhhODBjZThlMGI2ZjBlMGNi
M2ZhZDNiY2Q1ZDY1ZWJlMDYyMmVkMjhlYWFlOTdiNDU1OWE2YTg1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjc1N2FlOTY0YzE2YTU0MmQ2MDcwOGJjYjhhNjdjNTZjNWJlODM3ODVjMGQxYzUzNGI5
YjkzNjZiZjY3Njc0NmUiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgog
UkRFUEVORFM6JHtQTn0gKz0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
IHB5dGhvbjMtcHlnb2JqZWN0IgotLSAKMi40Ny4xCgo=

--===============1252267658217782225==--

