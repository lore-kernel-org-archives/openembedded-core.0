Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CCFC3A59E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.11563.1650052687169836472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7/ipNAE9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101802ecde95d-f90926b2-fb19-4280-996e-fb50eaae8332-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bTMikAyfORzMN5ESldHtxmnVhbF1GnIvhK/89plO9jk=;
	b=7/ipNAE9ZfPUeC96Uamv9b6SG2CDnUmtKTBLae7PiuacFeoRwC8Vwxfs28mcQJpr
	q4F+WLnp5OvJSC1aSiJmSPi+CHyndNGHJ2i3CtiBnR4U/57rAqOcqW5DdMuCVQ/FEbc
	+SK6MKn2Bn7RwxGAL5fHIaP7VYb8L/fJgodJlxUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bTMikAyfORzMN5ESldHtxmnVhbF1GnIvhK/89plO9jk=;
	b=BAdE1Kw7AnPMWJZ7Qvu3kJ8z48nsQgRYTVX5R5SRI2FLJU0yXO60ZJeAP/BNHK/K
	+4QIZt4jvJOkJdQV/g/vFs11Q6unSrBjOqgPsL4zq3pQI832KJQ6RqRSUPGdxuCwq3B
	DrypdOWIHuMg0RPgKP0Wcs3XCO2iSOxDCiaEEK4Q=
Content-Type: multipart/mixed; boundary="===============2461215180972145036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.42.8 FAILED
Message-ID: 
 <010101802ecde95d-f90926b2-fb19-4280-996e-fb50eaae8332-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164483

--===============2461215180972145036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdk-pixbuf* to *2.42.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.42.6-2.42.8.patch
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
--===============2461215180972145036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0c8c8a49a14b4148a3acafcbe99091aac84549fc"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 164 Local 155 Mirrors 0 Missed 9 Current 289 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 441 of 453 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 950 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 951 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1028 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1030 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_fetch: Succeeded
NOTE: Running task 1184 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: Running task 1185 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1186 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: Running task 1189 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 1666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_lic: Started
NOTE: Setscene tasks completed
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_lic: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1650 of 1666 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.61.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/
 yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gobject-introspection-native', 'glib-2.0-native', 'xz-native', 'libpng-native', 'meson-native', 'libjpeg-turbo-native', 'quilt-native', 'gettext-minimal-native', 'python3-native', 'shared-mime-info-native', 'ninja-native', 'pkgconfig-native', 'flex-native', 'zlib-native', 'libffi-native', 'libpcre-native', 'util-linux-native', 'gettext-native', 'libtool-native', 'python3-wheel-native', 'python3-installer-native', 'python3-setuptools-native', 'cmake-native', 'ncurses-native', 'bzip2-native', 'libtirpc-native', 'sqlite3-native', 'libnsl2-native', 'openssl-native', 'util-linux-libuuid-native', 'readline-native', 'gdbm-native', 'itstool-native', 'libxml2-native', 're2c-native', 'm4-native', 'texinfo-dummy-native', 'libpcre2-native', 'libcap-ng-native', 'python3-flit-core-native', 'unzip-native', 'curl-native', 'zstd-native', 'perl-native', 'gnu-config-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=disabled -Djpeg=true -Dpng=true -Dinstalled_tests=false -Dtiff=false...
| The Meson build system
| Version: 0.61.3
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/gdk-pixbuf-2.42.8
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/build
| Build type: native build
| 
| ../gdk-pixbuf-2.42.8/meson.build:1:0: ERROR: Value "true" (of type "string") for combo option "Enable JPEG loader (requires libjpeg), disabled on Windows if "native_windows_loaders" is used" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113:187 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113, line 187
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113, line 176
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113, line 200
NOTE: recipe gdk-pixbuf-native-2.42.8-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1650 tasks of which 1637 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-native-2.42.8-r0 do_configure: meson failed
ERROR: gdk-pixbuf-native-2.42.8-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/run.do_configure.3280113', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gdk-pixbuf-native/2.42.8-r0/temp/log.do_configure.3280113
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure) failed with exit code '1'

--===============2461215180972145036==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.42.6-2.42.8.patch"

From acd6c79012a8a220c7f357f514ba290f134e9b2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 16:02:05 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.42.6 -> 2.42.8

---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
index 55c16e4d66..5ffd2cd3a9 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
+SRC_URI[sha256sum] = "84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.27.0


--===============2461215180972145036==--

