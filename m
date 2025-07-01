Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8FC83F22
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1439.1751386811559340935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vVmqZJFk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YYxeS0Wl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6c9e9c9-9dfd443f-a588-4669-af07-da18cf7d3434-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3nT1918y6xH3sqo6PtN0wed2bEbbeyLitKs9JX+z6I0=;
	b=vVmqZJFkss7hlNAu3rGkorb/pdAL//dZFqKIle7S2DjTHaprO0KksxQeoIWEILhB
	OVlMEuJvr7/RcZAbaRpeWiM6bvk9uR7k5NgplmG5f9PorkBm4vD/SkqotLTbMXZ14b4
	79jnUD6Hm/oOPViIOTTssNKN1Os8t0frhgA416Ow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3nT1918y6xH3sqo6PtN0wed2bEbbeyLitKs9JX+z6I0=;
	b=YYxeS0WlYfvtJzN2RxUy0zJ2ASpKLRmVigUCyYiGJXpjkKh2nnGQUGhUwU8elfXE
	NpbgkfVNW1Unqyc00kDkOZNgSrwMpXXzjBkw51MBlTQ9l8NAj9CZbLXbD6fFBVXF70V
	rYoEt+R4B10ZU3GyGhROOJmDyyWnyqbwArHSMLK8=
Content-Type: multipart/mixed; boundary="===============3529210549054766820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lua: upgrading to 5.4.8 FAILED
Message-ID: <01010197c6c9e9c9-9dfd443f-a588-4669-af07-da18cf7d3434-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219629

--===============3529210549054766820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lua* to *5.4.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lua-upgrade-5.4.7-5.4.8.patch
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
From 8b2e7e974486a00d2c31766037ef861e2182bf70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:30:06 +0000
Subject: [PATCH] lua: upgrade 5.4.7 -> 5.4.8

---
 .../lua/{lua_5.4.7.bb => lua_5.4.8.bb}        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.7.bb => lua_5.4.8.bb} (76%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.7.bb b/meta/recipes-devtools/lua/lua_5.4.8.bb
similarity index 76%
rename from meta/recipes-devtools/lua/lua_5.4.7.bb
rename to meta/recipes-devtools/lua/lua_5.4.8.bb
index 6e414a0805..93b60f85d7 100644
--- a/meta/recipes-devtools/lua/lua_5.4.7.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.8.bb
@@ -1,7 +1,26 @@
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
+# @@ -1,4 +1,4 @@
+# -Copyright &copy; 1994&ndash;2024 Lua.org, PUC-Rio.
+# +Copyright &copy; 1994&ndash;2025 Lua.org, PUC-Rio.
+#  
+#  <P>
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+# 
+#
+
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=344ad98880a7ee9ff6e1498a519a7c76"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,7 +31,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30"
+SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
 SRC_URI[tarballtest.sha256sum] = "8a4898ffe4c7613c8009327a0722db7a41ef861d526c77c5b46114e59ebf811e"
 
 inherit pkgconfig binconfig ptest
-- 
2.47.1


--===============3529210549054766820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b53cc657a14db5848c74277533bcf37df26a7fde"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b53cc657a14db5848c74277533bcf37df26a7fde"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 174 Local 107 Mirrors 0 Missed 67 Current 276 (61% match, 85% complete)
Removing 7 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 16 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 371 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 372 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 394 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: Running setscene task 429 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running noexec task 769 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running task 770 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_recipe_qa)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lua-native-5.4.8-r0: task do_recipe_qa: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 826 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 845 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 853 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 861 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 878 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 879 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 437 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 897 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 912 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 913 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_recipe_qa unihash changed to c75f51ad52f623f0cb8a6fada251ed145be817d6f6c554b44e148895464f0c6b
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 417 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 920 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_fetch)
NOTE: Running task 921 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 922 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: Running task 923 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 924 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: Running task 934 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: Running task 936 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: Running task 937 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lua-native-5.4.8-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.8-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 943 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_unpack)
NOTE: Running task 944 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.8-r0: task do_recipe_qa: Started
NOTE: Running setscene task 443 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: Running task 946 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 947 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running setscene task 445 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 447 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 948 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-native-5.4.8-r0: task do_unpack: Started
NOTE: Running task 951 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe lua-5.4.8-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_recipe_qa unihash changed to fda3db38d259b1a6565cb73c54437a3638b93c7461134dae5040aab8e5971e32
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.8-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: Running task 954 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: Running task 955 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_patch)
NOTE: Running task 956 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: Running task 957 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_fetch)
NOTE: Running task 961 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 980 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 448 of 450 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 986 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.8-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: Running task 993 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 994 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 996 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe lua-native-5.4.8-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Started
NOTE: Running task 997 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.8-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1000 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1006 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1008 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: Running task 1033 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 1037 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 1038 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe lua-native-5.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe lua-native-5.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
WARNING: lua-5.4.8-r0 do_fetch: Checksum failure encountered with download of http://www.lua.org/tests/lua-5.4.8-tests.tar.gz;name=tarballtest - will attempt other sources if available
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_deploy_source_date_epoch unihash changed to 05f9d89cf58b5b3f9c6c576623c279e2ecf8dd9c625dfdb77a163dc7fd2e31d7
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: Running task 1042 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_configure)
NOTE: Running task 1045 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 1048 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: Running task 1052 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1081 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-native-5.4.8-r0: task do_configure: Succeeded
NOTE: Running task 1084 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_compile)
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 1085 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: recipe lua-native-5.4.8-r0: task do_compile: Started
NOTE: recipe shadow-4.17.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe shadow-4.17.4-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1102 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe lua-native-5.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1103 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_install)
NOTE: recipe lua-native-5.4.8-r0: task do_install: Started
NOTE: recipe lua-native-5.4.8-r0: task do_install: Succeeded
NOTE: Running task 1104 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_populate_sysroot)
NOTE: recipe lua-native-5.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe lua-native-5.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1105 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1106 of 1303 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1108 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1109 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 1111 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1112 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1113 of 1303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe lua-5.4.8-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1113 tasks of which 1049 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701082948.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701082948.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lua/5.4.8/temp/log.do_fetch.329742
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lua-5.4.8-r0 do_fetch: Fetcher failure for URL: 'http://www.lua.org/tests/lua-5.4.8-tests.tar.gz;name=tarballtest'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/lua-5.4.8-tests.tar.gz.tmp' has sha256 checksum '9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5' when '8a4898ffe4c7613c8009327a0722db7a41ef861d526c77c5b46114e59ebf811e' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: lua-5.4.8-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.lua.org/tests/lua-5.4.8-tests.tar.gz;name=tarballtest')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lua/5.4.8/temp/log.do_fetch.329742
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_fetch) failed with exit code '1'

--===============3529210549054766820==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lua-upgrade-5.4.7-5.4.8.patch"

RnJvbSA4YjJlN2U5NzQ0ODZhMDBkMmMzMTc2NjAzN2VmODYxZTIxODJiZjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODozMDowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx1
YTogdXBncmFkZSA1LjQuNyAtPiA1LjQuOAoKLS0tCiAuLi4vbHVhL3tsdWFfNS40LjcuYmIgPT4g
bHVhXzUuNC44LmJifSAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbHVhL3tsdWFfNS40LjcuYmIgPT4gbHVhXzUuNC44LmJifSAoNzYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNC43LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2x1YS9sdWFfNS40LjguYmIKc2ltaWxhcml0eSBpbmRleCA3NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2x1YS9sdWFfNS40LjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNC44LmJiCmluZGV4IDZlNDE0YTA4MDUu
LjkzYjYwZjg1ZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUu
NC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNC44LmJiCkBAIC0x
LDcgKzEsMjYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJl
ZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQ
bGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTon
IHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0
ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBkb2MvcmVhZG1lLmh0bWwKKyMgKysr
IGRvYy9yZWFkbWUuaHRtbAorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAmY29weTsg
MTk5NCZuZGFzaDsyMDI0IEx1YS5vcmcsIFBVQy1SaW8uCisjICtDb3B5cmlnaHQgJmNvcHk7IDE5
OTQmbmRhc2g7MjAyNSBMdWEub3JnLCBQVUMtUmlvLgorIyAgCisjICA8UD4KKyMgIFBlcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhIGNvcHkKKyMgCisjCisKIFNVTU1BUlkgPSAiTHVhIGlzIGEgcG93ZXJmdWwgbGlnaHQt
d2VpZ2h0IHByb2dyYW1taW5nIGxhbmd1YWdlIGRlc2lnbmVkIFwKIGZvciBleHRlbmRpbmcgYXBw
bGljYXRpb25zLiIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
ZG9jL3JlYWRtZS5odG1sO2JlZ2lubGluZT0zMDU7ZW5kbGluZT0zMjY7bWQ1PTM0NGFkOTg4ODBh
N2VlOWZmNmUxNDk4YTUxOWE3Yzc2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZG9jL3Jl
YWRtZS5odG1sO2JlZ2lubGluZT0zMDU7ZW5kbGluZT0zMjY7bWQ1PTBlNTczYzE0M2NiNjQ5MWI0
MWNmMDJjZmJjYjhjMjY3IgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5sdWEub3JnLyIKIAogU1JD
X1VSSSA9ICJodHRwOi8vd3d3Lmx1YS5vcmcvZnRwL2x1YS0ke1BWfS50YXIuZ3o7bmFtZT10YXJi
YWxsc3JjIFwKQEAgLTEyLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lmx1YS5vcmcv
ZnRwL2x1YS0ke1BWfS50YXIuZ3o7bmFtZT10YXJiYWxsc3JjIFwKICMgaWYgbm8gdGVzdCBzdWl0
ZSBtYXRjaGVzIFBWIHJlbGVhc2Ugb2YgTHVhIGV4YWN0bHksIGRvd25sb2FkIHRoZSBzdWl0ZSBm
b3IgdGhlIGNsb3Nlc3QgTHVhIHJlbGVhc2UuCiBQVl90ZXN0c3VpdGVzID0gIiR7UFZ9IgogCi1T
UkNfVVJJW3RhcmJhbGxzcmMuc2hhMjU2c3VtXSA9ICI5ZmJmNWUyOGVmODZjNjk4NThmNmQzZDM0
ZWNjYzMyZTkxMWMxYTI4YjQxMjBmZjNlODRhYWE3MGNmYmYxZTMwIgorU1JDX1VSSVt0YXJiYWxs
c3JjLnNoYTI1NnN1bV0gPSAiNGYxOGRkYWUxNTRlNzkzZTQ2ZWVhYjcyN2M1OWVmMWMwYzBjMmI3
NDRlN2I5NDIxOTcxMGQ3NmY1MzA2MjlhZSIKIFNSQ19VUklbdGFyYmFsbHRlc3Quc2hhMjU2c3Vt
XSA9ICI4YTQ4OThmZmU0Yzc2MTNjODAwOTMyN2EwNzIyZGI3YTQxZWY4NjFkNTI2Yzc3YzViNDYx
MTRlNTllYmY4MTFlIgogCiBpbmhlcml0IHBrZ2NvbmZpZyBiaW5jb25maWcgcHRlc3QKLS0gCjIu
NDcuMQoK

--===============3529210549054766820==--

