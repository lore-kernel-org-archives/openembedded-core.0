Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFBCC0032E
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8481.1698848703574249006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yvbev4ss;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k/FnvYs5;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460f5d-2e6b6acf-f105-4489-bfbb-600894000c05-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JTsE7AOLCruft5VtmVSHiOlDKdasA/x3O4SAwUkPBn4=;
	b=Yvbev4ssKsopzS176yPHZEfOo0EP3dwpuA65b7GgA35WvOVYxcp74Z39fv3UYg+T
	oO1KZR7xF2CDm0kQ3GXBebjJeBsUQ/5yp3Fccip/Vy0yFKGK1G8MDjjbBCm3tTL8Ufe
	1Ep5HU3cWezyAwxmudEzoWvjb+3K8AgmSuRHogZs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JTsE7AOLCruft5VtmVSHiOlDKdasA/x3O4SAwUkPBn4=;
	b=k/FnvYs5wgur/iOfdl9IPJG+U5obfnJAP/pr1qrV0ksZf5I61yJiB33vIHgORt8U
	l2v8pGWBuGXE5SALq991HRmg44PYPK2/s+F1Xrr0W5ISsbqIbzGV1guSDBJbzVVXFOP
	UwIDz0Um1qWFLMOUBWvvUtFbWjFK9kv1InAlvOPU=
Content-Type: multipart/mixed; boundary="===============1402815158242367697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.2 FAILED
Message-ID: <0101018b8b460f5d-2e6b6acf-f105-4489-bfbb-600894000c05-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190032

--===============1402815158242367697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.25.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.25.0-0.25.2.patch
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
From 67d1e9a0e02b6e9ba8b2900b1ff9b890fd36f571 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:18:01 +0000
Subject: [PATCH] p11-kit: upgrade 0.25.0 -> 0.25.2

---
 .../p11-kit/files/strerror-1.patch            | 76 -------------------
 .../p11-kit/files/strerror-2.patch            | 30 --------
 .../{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb}  |  6 +-
 3 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-1.patch
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-2.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb} (90%)

diff --git a/meta/recipes-support/p11-kit/files/strerror-1.patch b/meta/recipes-support/p11-kit/files/strerror-1.patch
deleted file mode 100644
index 6af4fee724..0000000000
--- a/meta/recipes-support/p11-kit/files/strerror-1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3ba2c55dfdc8ff20de369f07f6c57d08718d3add Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:22:49 +0100
-Subject: [PATCH] Check for GNU strerror_r using the compiler only
-
-The new test that was added to distinguish GNU/XSI strerror_r ran a
-compiled program, which doesn't work when cross-compiling. The only
-difference at compile time is that the GNU version returns char * and
-the XSI version returns int, so detect it by compiling a program that
-dereferences the return value.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 19 +++++++------------
- meson.build  | 10 +++++-----
- 2 files changed, 12 insertions(+), 17 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 40f5a583..29890622 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -146,19 +146,14 @@ if test "$os_unix" = "yes"; then
- 
- 	AC_CHECK_FUNC(
- 		[strerror_r],
--		[AC_RUN_IFELSE(
--			[AC_LANG_SOURCE([[
--				#include <errno.h>
--				#include <string.h>
--
--				int main (void)
--				{
--					char buf[32];
--					return strerror_r (EINVAL, buf, 32);
--				}
--			]])],
--                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
-+		[AC_COMPILE_IFELSE(
-+			[AC_LANG_PROGRAM([[#include <errno.h>
-+					   #include <string.h>]],
-+					 [[/* GNU strerror_r returns char *, XSI returns int */
-+					    char buf[32];
-+					    return *strerror_r (EINVAL, buf, 32);]])],
- 			[AC_DEFINE([HAVE_GNU_STRERROR_R], 1, [Whether GNU-specific strerror_r() is available])],
-+                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
- 			[])],
- 		[])
- 
-diff --git a/meson.build b/meson.build
-index 0f8c8da0..4cc3f89a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -306,15 +306,15 @@ if cc.has_function('strerror_r', prefix: '#include <string.h>')
- 
- int main (void)
- {
-+    /* GNU strerror_r returns char *, XSI returns int */
-     char buf[32];
--    return strerror_r (EINVAL, buf, 32);
-+    return *strerror_r (EINVAL, buf, 32);
- }
- '''
--  strerror_r_check = cc.run(strerror_r_code, name : 'strerror_r check')
--  if strerror_r_check.returncode() == 0
--    conf.set('HAVE_XSI_STRERROR_R', 1)
--  else
-+  if cc.compiles(strerror_r_code, name : 'GNU strerror_r check')
-     conf.set('HAVE_GNU_STRERROR_R', 1)
-+  else
-+    conf.set('HAVE_XSI_STRERROR_R', 1)
-   endif
- endif
- 
diff --git a/meta/recipes-support/p11-kit/files/strerror-2.patch b/meta/recipes-support/p11-kit/files/strerror-2.patch
deleted file mode 100644
index 1a9180b508..0000000000
--- a/meta/recipes-support/p11-kit/files/strerror-2.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7aa6251bf4ce36d027d53c9c96bb05f90ef7eb5b Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:44:06 +0100
-Subject: [PATCH] Define _GNU_SOURCE when testing for strerror_r
-
-The Meson check for GNU/XSI strerror_r didn't inherit the project
-options that include _GNU_SOURCE (unlike the autoconf version), so the
-result didn't match how the code that uses it will be compiled. Add
-_GNU_SOURCE explicitly as with the following checks.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 4cc3f89a..9a72e148 100644
---- a/meson.build
-+++ b/meson.build
-@@ -301,6 +301,7 @@ endforeach
- 
- if cc.has_function('strerror_r', prefix: '#include <string.h>')
-   strerror_r_code = '''
-+#define _GNU_SOURCE
- #include <errno.h>
- #include <string.h>
- 
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
similarity index 90%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
index ad1fda3f3b..107dbd0534 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
@@ -10,10 +10,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https \
-           file://strerror-1.patch \
-           file://strerror-2.patch"
-SRCREV = "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
+SRCREV = "66d6b42ef8dd84fcd8e199ac9f23f822f1a058c9"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


--===============1402815158242367697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b697da7ce1fe6f69e3a4c838643ace84aa4c8a68"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b697da7ce1fe6f69e3a4c838643ace84aa4c8a68"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 30 Mirrors 0 Missed 10 Current 342 (75% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 968 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_recipe_qa)
NOTE: Running task 1059 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_write_config)
NOTE: recipe p11-kit-0.25.2-r0: task do_recipe_qa: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1100 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_fetch)
NOTE: recipe p11-kit-0.25.2-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_unpack)
NOTE: Running task 1102 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.25.2-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_patch)
NOTE: Running task 1104 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1105 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1106 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_populate_lic)
NOTE: recipe p11-kit-0.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_populate_lic: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1107 of 1117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure)
NOTE: recipe p11-kit-0.25.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot', 'vir
 tual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/rec
 ipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'bash-completion', 'libtasn1', 'libffi', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'gtk-doc-native', 'libtasn1-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'glib-2.0-native', 'zlib-native', 'xz-native', 'bzip2-native', 'gdbm-native', 'util-linux-libuuid-native', 'openssl-native', 'sqlite3-native', 'ncurses-native', 'libtirpc-native', 'libedit-native', 'libnsl2-native', 'libtool-native', 'expat-native', 'libffi-native', 'libgcc', 'linux-libc-headers', 'attr-native', 'flex-native', 'mpfr-native', 'binutils-cross-x86_64', 'gmp-native', 'texinfo-dummy-native', 'libmpc-native', 'zstd-native', 'gnu-config-native', 're2c-native', 'gettext-minimal-native', 'python3-pyproject-hooks-native', 'python3-flit-core-native', 'python3
 -packaging-native', 'util-linux-native', 'libpcre2-native', 'perl-native', 'cmake-native', 'm4-native', 'unzip-native', 'libcap-ng-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: GTK_DOC_CHECK not called in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/configure.ac
| NOTE: Executing meson -Dgtk_doc=false -Dman=false...
| Submodule 'pkcs11-json' (https://github.com/p11-glue/pkcs11-json.git) registered for path './'
| Cloning into '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json'...
| fatal: unable to access 'https://github.com/p11-glue/pkcs11-json.git/': Could not resolve host: github.com
| fatal: clone of 'https://github.com/p11-glue/pkcs11-json.git' into submodule path '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json' failed
| Failed to clone 'subprojects/pkcs11-json'. Retry scheduled
| Cloning into '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json'...
| fatal: unable to access 'https://github.com/p11-glue/pkcs11-json.git/': Could not resolve host: github.com
| fatal: clone of 'https://github.com/p11-glue/pkcs11-json.git' into submodule path '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json' failed
| Failed to clone 'subprojects/pkcs11-json' a second time, aborting
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/build
| Build type: cross build
| Project name: p11-kit
| Project version: 0.25.2
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Has header "libintl.h" : YES
| Library intl found: NO
| Checking for size of "unsigned long" : 8
| Run-time dependency threads found: YES
| Checking for function "pthread_create" with dependency threads: YES
| Checking for function "nanosleep" : YES
| Checking for function "dlopen" : YES
| Library nsl found: NO
| Has header "locale.h" : YES
| Checking for type "locale_t" : YES
| Checking for function "newlocale" : YES
| Checking for function "strerror_l" : YES
| Has header "sys/resource.h" : YES
| Has header "sys/un.h" : YES
| Has header "ucred.h" : NO
| Checking for function "fdwalk" : NO
| Checking for function "getauxval" : YES
| Checking for function "getexecname" : NO
| Checking for function "getpeereid" : NO
| Checking for function "getpeerucred" : NO
| Checking for function "getprogname" : NO
| Checking for function "getresuid" : YES
| Checking for function "isatty" : YES
| Checking for function "issetugid" : NO
| Checking for function "mkdtemp" : YES
| Checking for function "mkstemp" : YES
| Checking for function "readpassphrase" : NO
| Checking for function "secure_getenv" : YES
| Checking for function "strndup" : YES
| Checking whether type "struct dirent" has member "d_type" : YES
| Checking if "thread-local storage class" compiles: YES
| Checking for function "gmtime_r" : YES
| Checking if "program_invocation_short_name_test_code" : links: YES
| Checking if "__libc_enable_secure" : links: YES
| Checking if "vsock_test" compiles: YES
| Checking for type "sighandler_t" : NO
| Checking for type "sig_t" : NO
| Checking for type "__sighandler_t" : NO
| Checking for type "sighandler_t" : NO
| Checking for type "sig_t" : YES
| Checking for type "__sighandler_t" : YES
| Has header "stdbool.h" : YES
| Checking for function "asprintf" : YES
| Checking for function "basename" : YES
| Checking for function "memdup" : NO
| Checking for function "reallocarray" : YES
| Checking for function "secure_getenv" : YES (cached)
| Checking for function "setenv" : YES
| Checking for function "strnstr" : NO
| Checking for function "vasprintf" : YES
| Checking for function "strerror_r" : YES
| Checking if "GNU strerror_r check" compiles: YES
| Header "errno.h" has symbol "program_invocation_short_name" : YES
| Header "stdio.h" has symbol "asprintf" : YES
| Header "stdio.h" has symbol "vasprintf" : YES
| Header "stdlib.h" has symbol "reallocarray" : YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libffi found: YES 3.4.4
| Run-time dependency libtasn1 found: YES 4.19.0
| Program asn1Parser found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/asn1Parser)
| Found CMake: NO
| Run-time dependency libsystemd found: NO (tried pkgconfig and cmake)
| Run-time dependency systemd found: NO (tried pkgconfig and cmake)
| Configuring config.h using configuration
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/nativepython3)
| 
| ../git/meson.build:452:22: ERROR: git submodule failed to init
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794, line 190
NOTE: recipe p11-kit-0.25.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1107 tasks of which 1097 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.2-r0 do_configure: meson failed
ERROR: p11-kit-0.25.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.4005794', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/log.do_configure.4005794
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure) failed with exit code '1'

--===============1402815158242367697==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.0-0.25.2.patch"

RnJvbSA2N2QxZTlhMGUwMmI2ZTliYThiMjkwMGIxZmY5Yjg5MGZkMzZmNTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDoxODowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHAx
MS1raXQ6IHVwZ3JhZGUgMC4yNS4wIC0+IDAuMjUuMgoKLS0tCiAuLi4vcDExLWtpdC9maWxlcy9z
dHJlcnJvci0xLnBhdGNoICAgICAgICAgICAgfCA3NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
cDExLWtpdC9maWxlcy9zdHJlcnJvci0yLnBhdGNoICAgICAgICAgICAgfCAzMCAtLS0tLS0tLQog
Li4uL3twMTEta2l0XzAuMjUuMC5iYiA9PiBwMTEta2l0XzAuMjUuMi5iYn0gIHwgIDYgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9maWxlcy9zdHJlcnJvci0x
LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9m
aWxlcy9zdHJlcnJvci0yLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtp
dC97cDExLWtpdF8wLjI1LjAuYmIgPT4gcDExLWtpdF8wLjI1LjIuYmJ9ICg5MCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9maWxlcy9zdHJlcnJvci0xLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9maWxlcy9zdHJlcnJvci0xLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2YWY0ZmVlNzI0Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3ItMS5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDc2ICswLDAgQEAKLUZyb20gM2JhMmM1NWRmZGM4ZmYyMGRlMzY5ZjA3
ZjZjNTdkMDg3MThkM2FkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFkYW0gU2Ft
cHNvbiA8YXRzQG9mZm9nLm9yZz4KLURhdGU6IFN1biwgMiBKdWwgMjAyMyAxNToyMjo0OSArMDEw
MAotU3ViamVjdDogW1BBVENIXSBDaGVjayBmb3IgR05VIHN0cmVycm9yX3IgdXNpbmcgdGhlIGNv
bXBpbGVyIG9ubHkKLQotVGhlIG5ldyB0ZXN0IHRoYXQgd2FzIGFkZGVkIHRvIGRpc3Rpbmd1aXNo
IEdOVS9YU0kgc3RyZXJyb3JfciByYW4gYQotY29tcGlsZWQgcHJvZ3JhbSwgd2hpY2ggZG9lc24n
dCB3b3JrIHdoZW4gY3Jvc3MtY29tcGlsaW5nLiBUaGUgb25seQotZGlmZmVyZW5jZSBhdCBjb21w
aWxlIHRpbWUgaXMgdGhhdCB0aGUgR05VIHZlcnNpb24gcmV0dXJucyBjaGFyICogYW5kCi10aGUg
WFNJIHZlcnNpb24gcmV0dXJucyBpbnQsIHNvIGRldGVjdCBpdCBieSBjb21waWxpbmcgYSBwcm9n
cmFtIHRoYXQKLWRlcmVmZXJlbmNlcyB0aGUgcmV0dXJuIHZhbHVlLgotCi1TaWduZWQtb2ZmLWJ5
OiBBZGFtIFNhbXBzb24gPGF0c0BvZmZvZy5vcmc+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotLS0t
Ci0gY29uZmlndXJlLmFjIHwgMTkgKysrKysrKy0tLS0tLS0tLS0tLQotIG1lc29uLmJ1aWxkICB8
IDEwICsrKysrLS0tLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3IGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1p
bmRleCA0MGY1YTU4My4uMjk4OTA2MjIgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBi
L2NvbmZpZ3VyZS5hYwotQEAgLTE0NiwxOSArMTQ2LDE0IEBAIGlmIHRlc3QgIiRvc191bml4IiA9
ICJ5ZXMiOyB0aGVuCi0gCi0gCUFDX0NIRUNLX0ZVTkMoCi0gCQlbc3RyZXJyb3Jfcl0sCi0tCQlb
QUNfUlVOX0lGRUxTRSgKLS0JCQlbQUNfTEFOR19TT1VSQ0UoW1sKLS0JCQkJI2luY2x1ZGUgPGVy
cm5vLmg+Ci0tCQkJCSNpbmNsdWRlIDxzdHJpbmcuaD4KLS0KLS0JCQkJaW50IG1haW4gKHZvaWQp
Ci0tCQkJCXsKLS0JCQkJCWNoYXIgYnVmWzMyXTsKLS0JCQkJCXJldHVybiBzdHJlcnJvcl9yIChF
SU5WQUwsIGJ1ZiwgMzIpOwotLQkJCQl9Ci0tCQkJXV0pXSwKLS0gICAgICAgICAgICAgICAgICAg
ICAgICBbQUNfREVGSU5FKFtIQVZFX1hTSV9TVFJFUlJPUl9SXSwgMSwgW1doZXRoZXIgWFNJLWNv
bXBsaWFudCBzdHJlcnJvcl9yKCkgaXMgYXZhaWxhYmxlXSldLAotKwkJW0FDX0NPTVBJTEVfSUZF
TFNFKAotKwkJCVtBQ19MQU5HX1BST0dSQU0oW1sjaW5jbHVkZSA8ZXJybm8uaD4KLSsJCQkJCSAg
ICNpbmNsdWRlIDxzdHJpbmcuaD5dXSwKLSsJCQkJCSBbWy8qIEdOVSBzdHJlcnJvcl9yIHJldHVy
bnMgY2hhciAqLCBYU0kgcmV0dXJucyBpbnQgKi8KLSsJCQkJCSAgICBjaGFyIGJ1ZlszMl07Ci0r
CQkJCQkgICAgcmV0dXJuICpzdHJlcnJvcl9yIChFSU5WQUwsIGJ1ZiwgMzIpO11dKV0sCi0gCQkJ
W0FDX0RFRklORShbSEFWRV9HTlVfU1RSRVJST1JfUl0sIDEsIFtXaGV0aGVyIEdOVS1zcGVjaWZp
YyBzdHJlcnJvcl9yKCkgaXMgYXZhaWxhYmxlXSldLAotKyAgICAgICAgICAgICAgICAgICAgICAg
IFtBQ19ERUZJTkUoW0hBVkVfWFNJX1NUUkVSUk9SX1JdLCAxLCBbV2hldGhlciBYU0ktY29tcGxp
YW50IHN0cmVycm9yX3IoKSBpcyBhdmFpbGFibGVdKV0sCi0gCQkJW10pXSwKLSAJCVtdKQotIAot
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDBmOGM4ZGEwLi40
Y2MzZjg5YSAxMDA2NDQKLS0tLSBhL21lc29uLmJ1aWxkCi0rKysgYi9tZXNvbi5idWlsZAotQEAg
LTMwNiwxNSArMzA2LDE1IEBAIGlmIGNjLmhhc19mdW5jdGlvbignc3RyZXJyb3JfcicsIHByZWZp
eDogJyNpbmNsdWRlIDxzdHJpbmcuaD4nKQotIAotIGludCBtYWluICh2b2lkKQotIHsKLSsgICAg
LyogR05VIHN0cmVycm9yX3IgcmV0dXJucyBjaGFyICosIFhTSSByZXR1cm5zIGludCAqLwotICAg
ICBjaGFyIGJ1ZlszMl07Ci0tICAgIHJldHVybiBzdHJlcnJvcl9yIChFSU5WQUwsIGJ1ZiwgMzIp
OwotKyAgICByZXR1cm4gKnN0cmVycm9yX3IgKEVJTlZBTCwgYnVmLCAzMik7Ci0gfQotICcnJwot
LSAgc3RyZXJyb3Jfcl9jaGVjayA9IGNjLnJ1bihzdHJlcnJvcl9yX2NvZGUsIG5hbWUgOiAnc3Ry
ZXJyb3JfciBjaGVjaycpCi0tICBpZiBzdHJlcnJvcl9yX2NoZWNrLnJldHVybmNvZGUoKSA9PSAw
Ci0tICAgIGNvbmYuc2V0KCdIQVZFX1hTSV9TVFJFUlJPUl9SJywgMSkKLS0gIGVsc2UKLSsgIGlm
IGNjLmNvbXBpbGVzKHN0cmVycm9yX3JfY29kZSwgbmFtZSA6ICdHTlUgc3RyZXJyb3JfciBjaGVj
aycpCi0gICAgIGNvbmYuc2V0KCdIQVZFX0dOVV9TVFJFUlJPUl9SJywgMSkKLSsgIGVsc2UKLSsg
ICAgY29uZi5zZXQoJ0hBVkVfWFNJX1NUUkVSUk9SX1InLCAxKQotICAgZW5kaWYKLSBlbmRpZgot
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9maWxlcy9zdHJlcnJv
ci0yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9maWxlcy9zdHJlcnJvci0y
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxYTkxODBiNTA4Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3ItMi5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMwICswLDAgQEAKLUZyb20gN2FhNjI1MWJmNGNlMzZk
MDI3ZDUzYzljOTZiYjA1ZjkwZWY3ZWI1YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEFkYW0gU2FtcHNvbiA8YXRzQG9mZm9nLm9yZz4KLURhdGU6IFN1biwgMiBKdWwgMjAyMyAxNTo0
NDowNiArMDEwMAotU3ViamVjdDogW1BBVENIXSBEZWZpbmUgX0dOVV9TT1VSQ0Ugd2hlbiB0ZXN0
aW5nIGZvciBzdHJlcnJvcl9yCi0KLVRoZSBNZXNvbiBjaGVjayBmb3IgR05VL1hTSSBzdHJlcnJv
cl9yIGRpZG4ndCBpbmhlcml0IHRoZSBwcm9qZWN0Ci1vcHRpb25zIHRoYXQgaW5jbHVkZSBfR05V
X1NPVVJDRSAodW5saWtlIHRoZSBhdXRvY29uZiB2ZXJzaW9uKSwgc28gdGhlCi1yZXN1bHQgZGlk
bid0IG1hdGNoIGhvdyB0aGUgY29kZSB0aGF0IHVzZXMgaXQgd2lsbCBiZSBjb21waWxlZC4gQWRk
Ci1fR05VX1NPVVJDRSBleHBsaWNpdGx5IGFzIHdpdGggdGhlIGZvbGxvd2luZyBjaGVja3MuCi0K
LVNpZ25lZC1vZmYtYnk6IEFkYW0gU2FtcHNvbiA8YXRzQG9mZm9nLm9yZz4KLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9u
QGFybS5jb20+Ci0tLS0KLSBtZXNvbi5idWlsZCB8IDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5k
ZXggNGNjM2Y4OWEuLjlhNzJlMTQ4IDEwMDY0NAotLS0tIGEvbWVzb24uYnVpbGQKLSsrKyBiL21l
c29uLmJ1aWxkCi1AQCAtMzAxLDYgKzMwMSw3IEBAIGVuZGZvcmVhY2gKLSAKLSBpZiBjYy5oYXNf
ZnVuY3Rpb24oJ3N0cmVycm9yX3InLCBwcmVmaXg6ICcjaW5jbHVkZSA8c3RyaW5nLmg+JykKLSAg
IHN0cmVycm9yX3JfY29kZSA9ICcnJwotKyNkZWZpbmUgX0dOVV9TT1VSQ0UKLSAjaW5jbHVkZSA8
ZXJybm8uaD4KLSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0gCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS4yLmJiCmluZGV4
IGFkMWZkYTNmM2IuLjEwN2RiZDA1MzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3AxMS1raXQvcDExLWtpdF8wLjI1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDEx
LWtpdC9wMTEta2l0XzAuMjUuMi5iYgpAQCAtMTAsMTAgKzEwLDggQEAgREVQRU5EUyA9ICJsaWJ0
YXNuMSBsaWJ0YXNuMS1uYXRpdmUgbGliZmZpIgogCiBERVBFTkRTOmFwcGVuZCA9ICIke0AnIGds
aWItMi4wJyBpZiBkLmdldFZhcignR1RLRE9DX0VOQUJMRUQnKSA9PSAnVHJ1ZScgZWxzZSAnJ30i
CiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9wMTEtZ2x1ZS9wMTEta2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAotICAgICAgICAgICBmaWxlOi8vc3RyZXJyb3ItMS5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly9zdHJlcnJvci0yLnBhdGNoIgotU1JDUkVWID0gImE4Y2Nl
OGJkODA2NWJiZjgwYmQ0NzIxOWY4NWYwY2Q5Y2YyN2RkMGMiCitTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgor
U1JDUkVWID0gIjY2ZDZiNDJlZjhkZDg0ZmNkOGUxOTlhYzlmMjNmODIyZjFhMDU4YzkiCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgotLSAKMi4zOS4yCgo=

--===============1402815158242367697==--

