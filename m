Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845B9C27C79
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.804.1686887482657561571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PdULiWc4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c25442df-cca3e5f2-e017-418d-8f3f-0a5395d766ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1pZZBoRn+jxpmXqtyor9ZlVCTQgOSpAYz6+T4NSkoWc=;
	b=PdULiWc4kf2RhtbuMM31FhPcirN0SYD9Smp3f1kVMgLUjFtBdDeM74f55XOvhVqw
	R3fmWoa3+Qg0FHT02exiNM7oWSWOBT/E++d22jcRUEGYxpJ2oQc3cnyYBrmAv4V3Elt
	PuVEobooNfEyC6xDM9zoN78vUL8Ox31R/eHhpURw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1pZZBoRn+jxpmXqtyor9ZlVCTQgOSpAYz6+T4NSkoWc=;
	b=iTGJ/P6EyLUFG2E82iFuH+ROfJYUr+qGaia4u3SjnftRGDUe3y0J6IASbHvWJ9pW
	mRYFD3yHZy+uJN2MUI4tiLIqAO2WtN4mjMVZSYtzxbjwOyjKkei29Wcr8Emkc5DfcHk
	aPpBgi48takfiqJJZF3MaT4hzDphF9mLyJ/6CswU=
Content-Type: multipart/mixed; boundary="===============0403275352112762285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.41.0 FAILED
Message-ID: <01010188c25442df-cca3e5f2-e017-418d-8f3f-0a5395d766ab-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182903

--===============0403275352112762285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.41.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-git-upgrade-2.39.3-2.41.0.patch
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
From ff01053004b78ca5b2da2acf9e7eec3d230a6b08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 09:15:06 +0000
Subject: [PATCH] git: upgrade 2.39.3 -> 2.41.0

---
 meta/recipes-devtools/git/{git_2.39.3.bb => git_2.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.3.bb => git_2.41.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.39.3.bb b/meta/recipes-devtools/git/git_2.41.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.3.bb
rename to meta/recipes-devtools/git/git_2.41.0.bb
index 54a863acd2..e88374528e 100644
--- a/meta/recipes-devtools/git/git_2.39.3.bb
+++ b/meta/recipes-devtools/git/git_2.41.0.bb
@@ -168,4 +168,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "2f9aa93c548941cc5aff641cedc24add15b912ad8c9b36ff5a41b1a9dcad783e"
+SRC_URI[tarball.sha256sum] = "c4a6a3dd1827895a80cbd824e14d94811796ae54037549e0da93f7b84cb45b9f"
-- 
2.39.2


--===============0403275352112762285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:37da4cbd9dabcd9344110b6fac92857f593d3d18"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 195 Local 186 Mirrors 0 Missed 9 Current 314 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1200 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running task 1733 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: Running task 1734 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: Running task 1735 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: Running task 1736 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1738 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_populate_lic)
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.41.0-r0: task do_populate_lic: Started
NOTE: recipe git-2.41.0-r0: task do_populate_lic: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1739 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1740 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/y
 octo-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do
 _populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'glibc', 'zlib', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'bash-completion', 'curl', 'autoconf-native', 'automake-native', 'patch-native', 'perl-native', 'pseudo-native', 'libgcc', 'linux-libc-headers', 'make-native', 'zlib-native', 'gdbm-native', 'gnu-config-native', 'm4-native', 'texinfo-dummy-native', 'xz-native', 'flex-native', 'libmpc-native', 'zstd-native', 'gmp-native', 'mpfr-native', 'binutils-cross-i686', 'opkg-utils', 'libidn2', 'attr-native', 'gettext-minimal-native', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 56 NO_PYTHON=1 CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot=  -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot-native=  LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0=/usr/src/debug/git/2.41.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now PERL_PATH=/usr/bin/env perl COMPUTE_HEADER_DEPENDENCIES=no NO_GETTEXT=1 install DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image bindir=/usr/bin template_dir=/usr/share/git-core/templates
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/gitweb'
| install -m 755 gitweb/gitweb.cgi '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/gitweb'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/gitweb/static'
| install -m 644 gitweb/static/gitweb.js gitweb/static/gitweb.css gitweb/static/git-logo.png gitweb/static/git-favicon.png \
| 	'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/gitweb/static'
|     SUBDIR templates
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/bin'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core'
| install   git-daemon git-http-backend git-imap-send git-sh-i18n--envsubst git-shell git-http-fetch git-http-push git-remote-http git-remote-https git-remote-ftp git-remote-ftps '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core'
| install git-difftool--helper git-filter-branch git-merge-octopus git-merge-one-file git-merge-resolve git-mergetool git-quiltimport git-request-pull git-submodule git-web--browse git-archimport git-cvsexportcommit git-cvsimport git-cvsserver git-send-email git-svn git-p4 git-instaweb '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core'
| install -m 644 git-mergetool--lib git-sh-i18n git-sh-setup '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core'
| install  git scalar git-receive-pack git-shell git-upload-archive git-upload-pack '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/bin'
| install git-cvsserver '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/bin'
| make -C templates DESTDIR='/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image' install
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0/templates'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates'
| (cd blt && tar cf - .) | \
| (cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates' && umask 022 && tar xof -)
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/git-2.41.0/templates'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/mergetools'
| install -m 644 mergetools/* '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/mergetools'
| install -d -m 755 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/perl5'
| (cd perl/build/lib && tar cf - .) | \
| (cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/perl5' && umask 022 && tar xof -)
| bindir=$(cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/bin' && pwd) && \
| execdir=$(cd '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core' && pwd) && \
| destdir_from_execdir_SQ=$(echo 'libexec/git-core' | sed -e 's|[^/][^/]*|..|g') && \
| { test "$bindir/" = "$execdir/" || \
|   for p in git scalar git-shell git-cvsserver; do \
| 	rm -f "$execdir/$p" && \
| 	test -n "" && \
| 	ln -s "$destdir_from_execdir_SQ/bin/$p" "$execdir/$p" || \
| 	{ test -z "" && \
| 	  ln "$bindir/$p" "$execdir/$p" 2>/dev/null || \
| 	  cp "$bindir/$p" "$execdir/$p" || exit; } \
|   done; \
| } && \
| for p in git-receive-pack git-upload-archive git-upload-pack; do \
| 	rm -f "$bindir/$p" && \
| 	test -n "" && \
| 	ln -s "git" "$bindir/$p" || \
| 	{ test -z "" && \
| 	  ln "$bindir/git" "$bindir/$p" 2>/dev/null || \
| 	  ln -s "git" "$bindir/$p" 2>/dev/null || \
| 	  cp "$bindir/git" "$bindir/$p" || exit; }; \
| done && \
| for p in git-add git-am git-annotate git-apply git-archive git-bisect git-blame git-branch git-bugreport git-bundle git-cat-file git-check-attr git-check-ignore git-check-mailmap git-check-ref-format git-checkout--worker git-checkout-index git-checkout git-clean git-clone git-column git-commit-graph git-commit-tree git-commit git-config git-count-objects git-credential-cache--daemon git-credential-cache git-credential-store git-credential git-describe git-diagnose git-diff-files git-diff-index git-diff-tree git-diff git-difftool git-fast-export git-fast-import git-fetch-pack git-fetch git-fmt-merge-msg git-for-each-ref git-for-each-repo git-fsck git-fsmonitor--daemon git-gc git-get-tar-commit-id git-grep git-hash-object git-help git-hook git-index-pack git-init-db git-interpret-trailers git-log git-ls-files git-ls-remote git-ls-tree git-mailinfo git-mailsplit git-merge-base git-merge-file git-merge-index git-merge-ours git-merge-recursive git-merge-tree git-merge git-mktag git-mktr
 ee git-multi-pack-index git-mv git-name-rev git-notes git-pack-objects git-pack-redundant git-pack-refs git-patch-id git-prune-packed git-prune git-pull git-push git-range-diff git-read-tree git-rebase git-receive-pack git-reflog git-remote-ext git-remote-fd git-remote git-repack git-replace git-rerere git-reset git-rev-list git-rev-parse git-revert git-rm git-send-pack git-shortlog git-show-branch git-show-index git-show-ref git-sparse-checkout git-stash git-stripspace git-submodule--helper git-symbolic-ref git-tag git-unpack-file git-unpack-objects git-update-index git-update-ref git-update-server-info git-upload-archive git-upload-pack git-var git-verify-commit git-verify-pack git-verify-tag git-worktree git-write-tree git-cherry git-cherry-pick git-format-patch git-fsck-objects git-init git-maintenance git-merge-subtree git-restore git-show git-stage git-status git-switch git-version git-whatchanged; do \
| 	rm -f "$execdir/$p" && \
| 	if test -z ""; \
| 	then \
| 		test -n "" && \
| 		ln -s "$destdir_from_execdir_SQ/bin/git" "$execdir/$p" || \
| 		{ test -z "" && \
| 		  ln "$execdir/git" "$execdir/$p" 2>/dev/null || \
| 		  ln -s "git" "$execdir/$p" 2>/dev/null || \
| 		  cp "$execdir/git" "$execdir/$p" || exit; }; \
| 	fi \
| done && \
| remote_curl_aliases="git-remote-https git-remote-ftp git-remote-ftps" && \
| for p in $remote_curl_aliases; do \
| 	rm -f "$execdir/$p" && \
| 	test -n "" && \
| 	ln -s "git-remote-http" "$execdir/$p" || \
| 	{ test -z "" && \
| 	  ln "$execdir/git-remote-http" "$execdir/$p" 2>/dev/null || \
| 	  ln -s "git-remote-http" "$execdir/$p" 2>/dev/null || \
| 	  cp "$execdir/git-remote-http" "$execdir/$p" || exit; } \
| done
| sed: can't read /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-add--interactive: No such file or directory
| sed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/prepare-commit-msg.sample: No data availablesed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/pre-rebase.sample: No data availablesed: warning: failed to get security context of /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/fsmonitor-watchman.sample: No data availableWARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/run.do_install.2481345:175 exit 2 from 'sed -i -e 's#/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/recipe-sysroot-native/usr/bin/perl-native/#/usr/bin/#' -e 's#/usr/li
 b/perl-native/#/usr/lib/#' /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/bin/git-cvsserver /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-add--interactive /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-archimport /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-cvsexportcommit /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-cvsimport /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-cvsserver /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-send-email /home/pokybuild/yocto-w
 orker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-svn /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/libexec/git-core/git-instaweb /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/gitweb/gitweb.cgi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/prepare-commit-msg.sample /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/pre-rebase.sample /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/image/usr/share/git-core/templates/hooks/fsmonitor-watchman.sample'
| WARNING: Backtrace (BB generated script):
| 	#1: perl_native_fixup, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/run.do_install.2481345, line 175
| 	#2: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/run.do_install.2481345, line 165
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/run.do_install.2481345, line 227
NOTE: recipe git-2.41.0-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1741 tasks of which 1731 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: git-2.41.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/run.do_install.2481345', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.41.0-r0/temp/log.do_install.2481345
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install) failed with exit code '1'

--===============0403275352112762285==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.39.3-2.41.0.patch"

RnJvbSBmZjAxMDUzMDA0Yjc4Y2E1YjJkYTJhY2Y5ZTdlZWMzZDIzMGE2YjA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDk6MTU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zOS4zIC0+IDIuNDEuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zOS4zLmJiID0+IGdpdF8yLjQxLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzkuMy5iYiA9PiBnaXRfMi40MS4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMy5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM5LjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDEuMC5iYgppbmRleCA1NGE4NjNhY2Qy
Li5lODgzNzQ1MjhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM5LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40MS4wLmJiCkBA
IC0xNjgsNCArMTY4LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjJmOWFhOTNjNTQ4OTQxY2M1
YWZmNjQxY2VkYzI0YWRkMTViOTEyYWQ4YzliMzZmZjVhNDFiMWE5ZGNhZDc4M2UiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJjNGE2YTNkZDE4Mjc4OTVhODBjYmQ4MjRlMTRkOTQ4MTE3
OTZhZTU0MDM3NTQ5ZTBkYTkzZjdiODRjYjQ1YjlmIgotLSAKMi4zOS4yCgo=

--===============0403275352112762285==--

