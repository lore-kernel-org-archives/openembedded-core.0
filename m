Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32DCC54E7C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.36635.1709330717123459758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CLMCB0C6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hVT+l23X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dfc0cd74d-ddee3f74-41c4-466e-97df-1990a5053dfd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a05rElHguCkjoty1LGxXkEcWtI5SfxP3UgxLFUS0Eno=;
	b=CLMCB0C6B/45pUMS56G02pdhBJnEvlQhQbtyHc0Y+1E1kz/jnPnHHdccbncKQUUw
	7sermS5p9V6zW5mOIaEHfeVBcsyshQC8WqH4SWg5o5I7VDLaj1/FoAtGIMTpvRab/Ic
	AlTVm9AQfApz72uZXva9cI65HrWRKLJi+ljutGbA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a05rElHguCkjoty1LGxXkEcWtI5SfxP3UgxLFUS0Eno=;
	b=hVT+l23Xf+J6GxnDmYswPatv8Js+2hYNN16VhBnfka1lCtgsaHFSCbWn/7mIFR2m
	MO+A+oImCdm3A/umu46EWcW3pbA1rYPBE/hytCq6f/X8kPfR8+wq+Jp8MfcABVy2d7H
	JWoKkaxDqrJwSZD8Hfqc9hKJ2AiteMdsBgYR3tfA=
Content-Type: multipart/mixed; boundary="===============3616618838203625429=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.06 FAILED
Message-ID: <0101018dfc0cd74d-ddee3f74-41c4-466e-97df-1990a5053dfd-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196498

--===============3616618838203625429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.06* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.05.01-6.06.patch
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
From 6006c41b69ff0711c7c9d4dab3deda6a100d58f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 14:54:32 +0000
Subject: [PATCH] man-pages: upgrade 6.05.01 -> 6.06

---
 ...man-pages_6.05.01.bb => man-pages_6.06.bb} | 109 +++++++++++++++++-
 1 file changed, 105 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.05.01.bb => man-pages_6.06.bb} (28%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb b/meta/recipes-extended/man-pages/man-pages_6.06.bb
similarity index 28%
rename from meta/recipes-extended/man-pages/man-pages_6.05.01.bb
rename to meta/recipes-extended/man-pages/man-pages_6.06.bb
index f0eb1a6132..43f0d1fa54 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.05.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.06.bb
@@ -1,12 +1,113 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -17,6 +17,7 @@
+#  
+#  Files
+#     CONTRIBUTING
+# +   CONTRIBUTING.d/*
+#         Instructions for reporting bugs and contributing.
+#  
+#     INSTALL
+# @@ -35,15 +36,12 @@
+#         Change log.  Includes most relevant changes.  However, it's not
+#         as complete as the git(1) log.
+#  
+# -   Makefile, share/mk/*
+# +   GNUmakefile, share/mk/*
+#         Build system.  For help, consult the <INSTALL> file, and run
+#         'make help'.
+#  
+#     lsm
+#         Linux software map.  See also <https://lsm.qqx.org/>.
+# -
+# -   .mailmap
+# -       See gitmailmap(5).
+#  
+#     LICENSES/*.txt
+#         Licenses in use by the project.
+# @@ -62,20 +60,20 @@
+#         Default directory for files created by the build system.
+#  
+#  Versions
+# -   Tarballs
+# -       <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/>
+# +   Distribution
+# +       <https://kernel.org/pub/linux/docs/man-pages/>
+# +       <https://www.alejandro-colomar.es/share/dist/man-pages/>
+#  
+#     Git
+# -       <git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git>
+#         <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/>
+# -
+# -       A secondary git(1) repository can be found at:
+# -       <git://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git>
+# -       <http://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/>
+# +       <https://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/>
+#  
+#     Online man-pages
+#         PDF
+# -             <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/book/>
+# +             <https://kernel.org/pub/linux/docs/man-pages/book/>
+# +             <https://www.alejandro-colomar.es/share/dist/man-pages/>
+# +       HTML
+# +             <https://man7.org/linux/man-pages/index.html>
+#  
+#  History
+#     Tarballs
+# @@ -83,7 +81,7 @@
+#         <https://www.win.tue.nl/~aeb/ftpdocs/linux-local/manpages.archive/>
+#  
+#     Maintainers
+# -       Alejandro Colomar <alx@kernel.org> <http://www.alejandro-colomar.es/>
+# +       Alejandro Colomar <alx@kernel.org> <https://www.alejandro-colomar.es/>
+#               2020 - present (5.09 - HEAD)
+#         Michael Kerrisk <mtk.manpages@gmail.com> <https://man7.org/>
+#               2004 - 2021    (2.00 - 5.13)
+# @@ -107,7 +105,7 @@
+#         man-pages(7)
+#  
+#     Website
+# -       <http://www.kernel.org/doc/man-pages/index.html>.
+# +       <https://www.kernel.org/doc/man-pages/index.html>.
+#  
+#     Downstream packages
+#         Arch man-pages
+# --- LICENSES/BSD-2-Clause.txt
+# +++ LICENSES/BSD-2-Clause.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) <year> <owner> 
+# +Copyright (c) <year> <owner>
+#  
+#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+#  
+# --- LICENSES/BSD-3-Clause.txt
+# +++ LICENSES/BSD-3-Clause.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) <year> <owner>. 
+# +Copyright (c) <year> <owner>.
+#  
+#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+#  
+# 
+#
+
 SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
-                    file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
-                    file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
+LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
+                    file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
+                    file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
                     file://LICENSES/GPL-1.0-or-later.txt;md5=e5b7c80002ef72ab868b43ce47b65125 \
                     file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
@@ -16,7 +117,7 @@ LIC_FILES_CHKSUM = "file://README;md5=cbd51cd3dd298230df8ddd4637e65c37 \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "b2dd44ca0342b50923291f06bdba38c42438e10c04843ce1f731cf3f50631e0a"
+SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
 
 inherit manpages
 
-- 
2.42.0


--===============3616618838203625429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1864 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8517fc098f4c3b03fd366bcb11c918624b19794c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8517fc098f4c3b03fd366bcb11c918624b19794c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 66 Local 54 Mirrors 0 Missed 12 Current 225 (81% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 776 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_recipe_qa)
NOTE: recipe man-pages-6.06-r0: task do_recipe_qa: Started
NOTE: recipe man-pages-6.06-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_recipe_qa unihash changed to 6ff3473b6aca0117dc1c958fa2ca576fc043315057bb085394e2820845ad2c30
NOTE: Setscene tasks completed
NOTE: Running task 866 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_fetch)
NOTE: recipe man-pages-6.06-r0: task do_fetch: Started
NOTE: recipe man-pages-6.06-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_unpack)
NOTE: Running task 868 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-pages-6.06-r0: task do_unpack: Started
NOTE: recipe man-pages-6.06-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-pages-6.06-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_patch)
NOTE: Running task 870 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_collect_spdx_deps)
NOTE: recipe man-pages-6.06-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-6.06-r0: task do_patch: Started
NOTE: recipe man-pages-6.06-r0: task do_collect_spdx_deps: Started
NOTE: recipe man-pages-6.06-r0: task do_patch: Succeeded
NOTE: Running task 871 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_deploy_source_date_epoch)
NOTE: Running task 872 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_populate_lic)
NOTE: recipe man-pages-6.06-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe man-pages-6.06-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-6.06-r0: task do_populate_lic: Started
NOTE: recipe man-pages-6.06-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_populate_lic unihash changed to eac385473b0e68d40f22ef4b9705c57853e00f0596ce6a549b0622d2c1676388
NOTE: recipe man-pages-6.06-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_deploy_source_date_epoch unihash changed to 9220fa486405f4ccd068b41a3ec3b7f17e4e109d6d1a44c60d06b3775770a89f
NOTE: Setscene tasks completed
NOTE: Running noexec task 873 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_configure)
NOTE: Running noexec task 874 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_compile)
NOTE: Running task 875 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install)
NOTE: recipe man-pages-6.06-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 install prefix=/usr DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image
| fatal: not a git repository (or any of the parent directories): .git
| bash: locale: command not found
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man1/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man2/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man4/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man5/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man6/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man7/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man8/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man2type/
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/a64l.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abort.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abs.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acos.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosf.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosh.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshf.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshl.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosl.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addmntent.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addseverity.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/adjtime.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/__after_morecore_hook.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_cancel.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_error.3
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_fsync.3
| install: cannot stat '/dev/stdin': No such file or directory
| INSTALL	/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_init.3
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/a64l.3] Error 1
| make: *** Waiting for unfinished jobs....
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| install: install: cannot stat '/dev/stdin'cannot stat '/dev/stdin': No such file or directory
| : No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abs.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/abort.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acos.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosh.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshf.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosf.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| install: cannot stat '/dev/stdin'install: cannot stat '/dev/stdin': No such file or directory
| : No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acoshl.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/acosl.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addseverity.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/addmntent.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/adjtime.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/__after_morecore_hook.3] Error 1
| install: cannot stat '/dev/stdin': No such file or directory
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_cancel.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_fsync.3] Error 1
| make: *** [share/mk/install/man.mk:63: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/image/usr/share/man/man3/aio_error.3] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475, line 174
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475, line 158
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475, line 153
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475, line 187
NOTE: recipe man-pages-6.06-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 875 tasks of which 864 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301145411.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301145411.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: man-pages-6.06-r0 do_install: oe_runmake failed
ERROR: man-pages-6.06-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/run.do_install.1964475', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-pages/6.06/temp/log.do_install.1964475
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-pages/man-pages_6.06.bb:do_install) failed with exit code '1'

--===============3616618838203625429==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.05.01-6.06.patch"

RnJvbSA2MDA2YzQxYjY5ZmYwNzExYzdjOWQ0ZGFiM2RlZGE2YTEwMGQ1OGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNDo1NDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
bi1wYWdlczogdXBncmFkZSA2LjA1LjAxIC0+IDYuMDYKCi0tLQogLi4ubWFuLXBhZ2VzXzYuMDUu
MDEuYmIgPT4gbWFuLXBhZ2VzXzYuMDYuYmJ9IHwgMTA5ICsrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMve21hbi1wYWdlc182LjA1LjAxLmJiID0+IG1h
bi1wYWdlc182LjA2LmJifSAoMjglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDUuMDEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bWFuLXBhZ2VzL21hbi1wYWdlc182LjA2LmJiCnNpbWlsYXJpdHkgaW5kZXggMjglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDUuMDEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDYu
YmIKaW5kZXggZjBlYjFhNjEzMi4uNDNmMGQxZmE1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wNS4wMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjA2LmJiCkBAIC0xLDEyICsxLDExMyBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRQorIyArKysgUkVBRE1FCisjIEBAIC0xNyw2
ICsxNyw3IEBACisjICAKKyMgIEZpbGVzCisjICAgICBDT05UUklCVVRJTkcKKyMgKyAgIENPTlRS
SUJVVElORy5kLyoKKyMgICAgICAgICBJbnN0cnVjdGlvbnMgZm9yIHJlcG9ydGluZyBidWdzIGFu
ZCBjb250cmlidXRpbmcuCisjICAKKyMgICAgIElOU1RBTEwKKyMgQEAgLTM1LDE1ICszNiwxMiBA
QAorIyAgICAgICAgIENoYW5nZSBsb2cuICBJbmNsdWRlcyBtb3N0IHJlbGV2YW50IGNoYW5nZXMu
ICBIb3dldmVyLCBpdCdzIG5vdAorIyAgICAgICAgIGFzIGNvbXBsZXRlIGFzIHRoZSBnaXQoMSkg
bG9nLgorIyAgCisjIC0gICBNYWtlZmlsZSwgc2hhcmUvbWsvKgorIyArICAgR05VbWFrZWZpbGUs
IHNoYXJlL21rLyoKKyMgICAgICAgICBCdWlsZCBzeXN0ZW0uICBGb3IgaGVscCwgY29uc3VsdCB0
aGUgPElOU1RBTEw+IGZpbGUsIGFuZCBydW4KKyMgICAgICAgICAnbWFrZSBoZWxwJy4KKyMgIAor
IyAgICAgbHNtCisjICAgICAgICAgTGludXggc29mdHdhcmUgbWFwLiAgU2VlIGFsc28gPGh0dHBz
Oi8vbHNtLnFxeC5vcmcvPi4KKyMgLQorIyAtICAgLm1haWxtYXAKKyMgLSAgICAgICBTZWUgZ2l0
bWFpbG1hcCg1KS4KKyMgIAorIyAgICAgTElDRU5TRVMvKi50eHQKKyMgICAgICAgICBMaWNlbnNl
cyBpbiB1c2UgYnkgdGhlIHByb2plY3QuCisjIEBAIC02MiwyMCArNjAsMjAgQEAKKyMgICAgICAg
ICBEZWZhdWx0IGRpcmVjdG9yeSBmb3IgZmlsZXMgY3JlYXRlZCBieSB0aGUgYnVpbGQgc3lzdGVt
LgorIyAgCisjICBWZXJzaW9ucworIyAtICAgVGFyYmFsbHMKKyMgLSAgICAgICA8aHR0cHM6Ly9t
aXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4tcGFnZXMvPgorIyArICAg
RGlzdHJpYnV0aW9uCisjICsgICAgICAgPGh0dHBzOi8va2VybmVsLm9yZy9wdWIvbGludXgvZG9j
cy9tYW4tcGFnZXMvPgorIyArICAgICAgIDxodHRwczovL3d3dy5hbGVqYW5kcm8tY29sb21hci5l
cy9zaGFyZS9kaXN0L21hbi1wYWdlcy8+CisjICAKKyMgICAgIEdpdAorIyAtICAgICAgIDxnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RvY3MvbWFuLXBhZ2VzL21hbi1wYWdlcy5naXQ+Cisj
ICAgICAgICAgPGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kb2NzL21hbi1wYWdlcy9t
YW4tcGFnZXMuZ2l0Lz4KKyMgLQorIyAtICAgICAgIEEgc2Vjb25kYXJ5IGdpdCgxKSByZXBvc2l0
b3J5IGNhbiBiZSBmb3VuZCBhdDoKKyMgLSAgICAgICA8Z2l0Oi8vd3d3LmFsZWphbmRyby1jb2xv
bWFyLmVzL3NyYy9hbHgvbGludXgvbWFuLXBhZ2VzL21hbi1wYWdlcy5naXQ+CisjIC0gICAgICAg
PGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvc3JjL2FseC9saW51eC9tYW4tcGFnZXMv
bWFuLXBhZ2VzLmdpdC8+CisjICsgICAgICAgPGh0dHBzOi8vd3d3LmFsZWphbmRyby1jb2xvbWFy
LmVzL3NyYy9hbHgvbGludXgvbWFuLXBhZ2VzL21hbi1wYWdlcy5naXQvPgorIyAgCisjICAgICBP
bmxpbmUgbWFuLXBhZ2VzCisjICAgICAgICAgUERGCisjIC0gICAgICAgICAgICAgPGh0dHBzOi8v
bWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzL2Jvb2svPgor
IyArICAgICAgICAgICAgIDxodHRwczovL2tlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBh
Z2VzL2Jvb2svPgorIyArICAgICAgICAgICAgIDxodHRwczovL3d3dy5hbGVqYW5kcm8tY29sb21h
ci5lcy9zaGFyZS9kaXN0L21hbi1wYWdlcy8+CisjICsgICAgICAgSFRNTAorIyArICAgICAgICAg
ICAgIDxodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9pbmRleC5odG1sPgorIyAgCisj
ICBIaXN0b3J5CisjICAgICBUYXJiYWxscworIyBAQCAtODMsNyArODEsNyBAQAorIyAgICAgICAg
IDxodHRwczovL3d3dy53aW4udHVlLm5sL35hZWIvZnRwZG9jcy9saW51eC1sb2NhbC9tYW5wYWdl
cy5hcmNoaXZlLz4KKyMgIAorIyAgICAgTWFpbnRhaW5lcnMKKyMgLSAgICAgICBBbGVqYW5kcm8g
Q29sb21hciA8YWx4QGtlcm5lbC5vcmc+IDxodHRwOi8vd3d3LmFsZWphbmRyby1jb2xvbWFyLmVz
Lz4KKyMgKyAgICAgICBBbGVqYW5kcm8gQ29sb21hciA8YWx4QGtlcm5lbC5vcmc+IDxodHRwczov
L3d3dy5hbGVqYW5kcm8tY29sb21hci5lcy8+CisjICAgICAgICAgICAgICAgMjAyMCAtIHByZXNl
bnQgKDUuMDkgLSBIRUFEKQorIyAgICAgICAgIE1pY2hhZWwgS2VycmlzayA8bXRrLm1hbnBhZ2Vz
QGdtYWlsLmNvbT4gPGh0dHBzOi8vbWFuNy5vcmcvPgorIyAgICAgICAgICAgICAgIDIwMDQgLSAy
MDIxICAgICgyLjAwIC0gNS4xMykKKyMgQEAgLTEwNyw3ICsxMDUsNyBAQAorIyAgICAgICAgIG1h
bi1wYWdlcyg3KQorIyAgCisjICAgICBXZWJzaXRlCisjIC0gICAgICAgPGh0dHA6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvbWFuLXBhZ2VzL2luZGV4Lmh0bWw+LgorIyArICAgICAgIDxodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9tYW4tcGFnZXMvaW5kZXguaHRtbD4uCisjICAKKyMgICAgIERvd25z
dHJlYW0gcGFja2FnZXMKKyMgICAgICAgICBBcmNoIG1hbi1wYWdlcworIyAtLS0gTElDRU5TRVMv
QlNELTItQ2xhdXNlLnR4dAorIyArKysgTElDRU5TRVMvQlNELTItQ2xhdXNlLnR4dAorIyBAQCAt
MSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgPHllYXI+IDxvd25lcj4gCisjICtDb3B5cmln
aHQgKGMpIDx5ZWFyPiA8b3duZXI+CisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4g
c291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24sIGFy
ZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlIG1l
dDoKKyMgIAorIyAtLS0gTElDRU5TRVMvQlNELTMtQ2xhdXNlLnR4dAorIyArKysgTElDRU5TRVMv
QlNELTMtQ2xhdXNlLnR4dAorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgPHll
YXI+IDxvd25lcj4uIAorIyArQ29weXJpZ2h0IChjKSA8eWVhcj4gPG93bmVyPi4KKyMgIAorIyAg
UmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBv
ciB3aXRob3V0IG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0OgorIyAgCisjIAorIworCiBTVU1NQVJZID0gIkxp
bnV4IG1hbi1wYWdlcyIKIERFU0NSSVBUSU9OID0gIlRoZSBMaW51eCBtYW4tcGFnZXMgcHJvamVj
dCBkb2N1bWVudHMgdGhlIExpbnV4IGtlcm5lbCBhbmQgQyBsaWJyYXJ5IGludGVyZmFjZXMgdGhh
dCBhcmUgZW1wbG95ZWQgYnkgdXNlciBwcm9ncmFtcyIKIFNFQ1RJT04gPSAiY29uc29sZS91dGls
cyIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4t
cGFnZXMiCiBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgJiBHUEwtMi4wLW9ubHkgJiBHUEwt
MS4wLW9yLWxhdGVyICYgQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlICYgQlNELTQtQ2xhdXNl
ICYgTUlUIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PWNiZDUxY2Qz
ZGQyOTgyMzBkZjhkZGQ0NjM3ZTY1YzM3IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJ
Q0VOU0VTL0JTRC0yLUNsYXVzZS50eHQ7bWQ1PWQwZjI4MGQxMDU4ZTc3ZTY2MjY0YTliOWUxMGU2
Yzg5IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0JTRC0zLUNsYXVzZS50
eHQ7bWQ1PTcxZjczOWVmNzU1ODFjYWUzMTJlOGM3MTFiY2RhYjE2IFwKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL1JFQURNRTttZDU9NzJjZmYwNmI3OTU0MjIyYzI0ZDM4YmMyYzQxYjIzNGUg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvQlNELTItQ2xhdXNlLnR4dDtt
ZDU9OWUxNjU5NGEyMjgzMDEwODlkNzU5YjRmMTc4ZGI5MWYgXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5TRVMvQlNELTMtQ2xhdXNlLnR4dDttZDU9NDA3NDI2ZmNjMWEyNDNiN2Iy
ZWZmNmUzNWM1NmFjYTkgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvQlNE
LTQtQ2xhdXNlLVVDLnR4dDttZDU9MWRhM2NmOGFkNTBjZDhkNWQxZGUzY2ZjNTMxOTZkMDEgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvR1BMLTEuMC1vci1sYXRlci50eHQ7
bWQ1PWU1YjdjODAwMDJlZjcyYWI4NjhiNDNjZTQ3YjY1MTI1IFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOU0VTL0dQTC0yLjAtb25seS50eHQ7bWQ1PTNkMjYyMDMzMDNhNzIyZGVk
YzZiZjkwOWQ5NWJhODE1IFwKQEAgLTE2LDcgKzExNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL1JFQURNRTttZDU9Y2JkNTFjZDNkZDI5ODIzMGRmOGRkZDQ2MzdlNjVjMzcgXAogICAg
ICAgICAgICAgICAgICAgICAiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgv
ZG9jcy8ke0JQTn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJkZDQ0
Y2EwMzQyYjUwOTIzMjkxZjA2YmRiYTM4YzQyNDM4ZTEwYzA0ODQzY2UxZjczMWNmM2Y1MDYzMWUw
YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMDY5MDZlN2JlODFhNzFjMmQzNDc4MDk1OTdiY2I5
MTQ4NWZhN2ZhNDg4YWNkYWE3OWU2ODFkZGZhODk0NTY4IgogCiBpbmhlcml0IG1hbnBhZ2VzCiAK
LS0gCjIuNDIuMAoK

--===============3616618838203625429==--

