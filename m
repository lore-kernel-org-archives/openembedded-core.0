Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEE7C531BC
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1409.1771440094295998695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DCs3wyr1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gRjs911t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720ed887-cd4c2147-90c4-4129-9d5f-1440e6de47fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zcsHlWMXmnbJviR9QQUtsu1pCDr+lx3qBGGogWgbODk=;
	b=DCs3wyr1DubhtiLIZGc2F1Llu9fi5FW6L/goi3fe28tBn5Vbv65azMqzaaC+xUci
	l3thwnwf67M/Szyfg29YcE8Un3m3VVvBw4g/YkW08L5jLbcCbnZmWR1l4W9PKE2Ywv+
	fWAva++Y1NdGrKNhIRUOkDeyPmyYc6tze2fIKm7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zcsHlWMXmnbJviR9QQUtsu1pCDr+lx3qBGGogWgbODk=;
	b=gRjs911tQyDT5iUNA9yHvGM6XwqnRk5AbcvpoL4exNU5W5bGx50ToOz2Yu9Rgf0y
	0N4dJXDwoQE56UO5rBUls4ILXkSecu6Ea+d6SAA8aplZnc2Rj22NNYTEZyZB47+G/J9
	sPoo6TLrceEo5Ht3XimhJ1qIUPQqU6zgvDcDyFPY=
Content-Type: multipart/mixed; boundary="===============4973257388117994271=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lua: upgrading to 5.5.0 FAILED
Message-ID: <0101019c720ed887-cd4c2147-90c4-4129-9d5f-1440e6de47fe-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231349

--===============4973257388117994271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lua* to *5.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lua-upgrade-5.4.8-5.5.0.patch
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
From 68a85368da740f778a3f08680316b84ed4b0a93c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:57:42 +0000
Subject: [PATCH] lua: upgrade 5.4.8 -> 5.5.0

---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}        | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (63%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 63%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..3b23b1d4ad 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- doc/readme.html
+# +++ doc/readme.html
+# @@ -1,9 +1,3 @@
+# -Copyright &copy; 1994&ndash;2025 Lua.org, PUC-Rio.
+# -
+# -<P>
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to deal
+# -in the Software without restriction, including without limitation the rights
+#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#  copies of the Software, and to permit persons to whom the Software is
+#  furnished to do so, subject to the following conditions:
+# @@ -20,3 +14,9 @@
+#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+# +</BLOCKQUOTE>
+# +<P>
+# +
+# +<P CLASS="footer">
+# +Last update:
+# +Wed Dec 10 11:37:23 UTC 2025
+# 
+#
+
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=b61eb40fb7838eaf69a3186c50060b8c"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,7 +45,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
 SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
 
 inherit pkgconfig binconfig ptest
-- 
2.47.1


--===============4973257388117994271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-38d760fe8eff7bf581b1b93194dfcb170c80bdc9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:38d760fe8eff7bf581b1b93194dfcb170c80bdc9"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 152 Local 88 Mirrors 0 Missed 64 Current 302 (57% match, 85% complete)
done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 16 stale sstate objects for arch qemux86_64...done.
Removing 26 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 379 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 417 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 420 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_stash_locale_setscene)
NOTE: Running setscene task 435 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_stash_locale_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 436 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 797 of 1315 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: Running setscene task 439 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-native-5.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 978 of 1315 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe lua-native-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-native-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1060 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe lua-native-5.5.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r1: task do_stash_locale_setscene: Succeeded
NOTE: recipe lua-native-5.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 451 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1065 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_unpack)
NOTE: Running task 1066 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-native-5.5.0-r0: task do_unpack: Started
NOTE: recipe lua-native-5.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-native-5.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_patch)
NOTE: recipe lua-native-5.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: lua-5.5.0-r0 do_fetch: Checksum failure encountered with download of http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest - will attempt other sources if available
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 454 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe lua-native-5.5.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 454 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-native-5.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1080 of 1315 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile)
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_compile: Started
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1134 of 1315 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.42+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.42+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1137 of 1315 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_configure)
NOTE: recipe glibc-2.42+git-r1: task do_configure: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=gcc  -fPIC MYCFLAGS=-isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fPIC MYLDFLAGS=-L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/pokybuild/yo
 cto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread AR=ar rcD RANLIB=ranlib -D linux-readline
| make: *** No rule to make target 'linux-readline'.  Stop.
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859:168 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859, line 168
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859, line 152
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859, line 147
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859, line 142
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859, line 181
NOTE: recipe lua-native-5.5.0-r0: task do_compile: Failed
NOTE: recipe glibc-2.42+git-r1: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1137 tasks of which 1127 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218125729.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218125729.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lua/5.5.0/temp/log.do_fetch.244464
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/log.do_compile.244859
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: lua-5.5.0-r0 do_fetch: Fetcher failure for URL: 'http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/lua-5.5.0-tests.tar.gz.tmp' has sha256 checksum '5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472' when '9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: lua-5.5.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest')
ERROR: lua-native-5.5.0-r0 do_compile: oe_runmake failed
ERROR: lua-native-5.5.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.244859' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lua/5.5.0/temp/log.do_fetch.244464
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/log.do_compile.244859
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile) failed with exit code '1'

--===============4973257388117994271==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lua-upgrade-5.4.8-5.5.0.patch"

RnJvbSA2OGE4NTM2OGRhNzQwZjc3OGEzZjA4NjgwMzE2Yjg0ZWQ0YjBhOTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NTc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dWE6IHVwZ3JhZGUgNS40LjggLT4gNS41LjAKCi0tLQogLi4uL2x1YS97bHVhXzUuNC44LmJiID0+
IGx1YV81LjUuMC5iYn0gICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2x1YS97bHVhXzUuNC44LmJiID0+IGx1YV81LjUuMC5iYn0gKDYzJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbHVhL2x1YV81LjQuOC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNjMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNC44LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbHVhL2x1YV81LjUuMC5iYgppbmRleCAxZDM3Y2RkZWI4
Li4zYjIzYjFkNGFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbHVhL2x1YV81
LjQuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbHVhL2x1YV81LjUuMC5iYgpAQCAt
MSw3ICsxLDQwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gZG9jL3JlYWRtZS5odG1sCisjICsr
KyBkb2MvcmVhZG1lLmh0bWwKKyMgQEAgLTEsOSArMSwzIEBACisjIC1Db3B5cmlnaHQgJmNvcHk7
IDE5OTQmbmRhc2g7MjAyNSBMdWEub3JnLCBQVUMtUmlvLgorIyAtCisjIC08UD4KKyMgLVBlcm1p
c3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9i
dGFpbmluZyBhIGNvcHkKKyMgLW9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1l
bnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjIC1pbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUg
cmlnaHRzCisjICB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1
dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCisjICBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBh
bmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgIGZ1cm5pc2hl
ZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjIEBAIC0y
MCwzICsxNCw5IEBACisjICBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRS
QUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAgT1VUIE9GIE9SIElOIENP
Tk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJ
TgorIyAgVEhFIFNPRlRXQVJFLgorIyArPC9CTE9DS1FVT1RFPgorIyArPFA+CisjICsKKyMgKzxQ
IENMQVNTPSJmb290ZXIiPgorIyArTGFzdCB1cGRhdGU6CisjICtXZWQgRGVjIDEwIDExOjM3OjIz
IFVUQyAyMDI1CisjIAorIworCiBTVU1NQVJZID0gIkx1YSBpcyBhIHBvd2VyZnVsIGxpZ2h0LXdl
aWdodCBwcm9ncmFtbWluZyBsYW5ndWFnZSBkZXNpZ25lZCBcCiBmb3IgZXh0ZW5kaW5nIGFwcGxp
Y2F0aW9ucy4iCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2Rv
Yy9yZWFkbWUuaHRtbDtiZWdpbmxpbmU9MzA1O2VuZGxpbmU9MzI2O21kNT0wZTU3M2MxNDNjYjY0
OTFiNDFjZjAyY2ZiY2I4YzI2NyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RvYy9yZWFk
bWUuaHRtbDtiZWdpbmxpbmU9MzA1O2VuZGxpbmU9MzI2O21kNT1iNjFlYjQwZmI3ODM4ZWFmNjlh
MzE4NmM1MDA2MGI4YyIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cubHVhLm9yZy8iCiAKIFNSQ19V
UkkgPSAiaHR0cDovL3d3dy5sdWEub3JnL2Z0cC9sdWEtJHtQVn0udGFyLmd6O25hbWU9dGFyYmFs
bHNyYyBcCkBAIC0xMiw3ICs0NSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5sdWEub3JnL2Z0
cC9sdWEtJHtQVn0udGFyLmd6O25hbWU9dGFyYmFsbHNyYyBcCiAjIGlmIG5vIHRlc3Qgc3VpdGUg
bWF0Y2hlcyBQViByZWxlYXNlIG9mIEx1YSBleGFjdGx5LCBkb3dubG9hZCB0aGUgc3VpdGUgZm9y
IHRoZSBjbG9zZXN0IEx1YSByZWxlYXNlLgogUFZfdGVzdHN1aXRlcyA9ICIke1BWfSIKIAotU1JD
X1VSSVt0YXJiYWxsc3JjLnNoYTI1NnN1bV0gPSAiNGYxOGRkYWUxNTRlNzkzZTQ2ZWVhYjcyN2M1
OWVmMWMwYzBjMmI3NDRlN2I5NDIxOTcxMGQ3NmY1MzA2MjlhZSIKK1NSQ19VUklbdGFyYmFsbHNy
Yy5zaGEyNTZzdW1dID0gIjU3Y2NjMzJiYmJkMDA1Y2FiNzViY2M1MjQ0NDA1MjUzNWFmNjkxNzg5
ZGJhMmI5MDE2ZDVjNTA2NDBkNjhiM2QiCiBTUkNfVVJJW3RhcmJhbGx0ZXN0LnNoYTI1NnN1bV0g
PSAiOTU4MWQ1YTdjMzlmZmJmMjliOGNjZGUyNzA5MDgzYzM4MGY3YmJkZGJkOTY4ZGNiMTU3MTJk
MmYyZTMzZjRlNSIKIAogaW5oZXJpdCBwa2djb25maWcgYmluY29uZmlnIHB0ZXN0Ci0tIAoyLjQ3
LjEKCg==

--===============4973257388117994271==--

