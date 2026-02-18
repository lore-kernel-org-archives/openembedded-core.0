Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518EAC53200
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1771440097377364361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PUFdBzHN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fQ1erxwp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720efcb1-f1518fdf-a73f-4f0f-9838-aa20dd12984f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VxVVj8rb+t9ofX/c0YBsTap4G8+K6v07FC3orMKBOd8=;
	b=PUFdBzHNh/6ahuD7JAto2wV0Oel2tJETQxfNpr+E44TUJplX6TX/IFjHhDQz06hC
	ms5+VmSgPKr7BxWaJWaxxDzQWJI3d7U3hSPnxuHcaOQH5HxClfbQ46YTlrwKhCNzmKX
	nfIu0ROtJld9oJrsft3SCkgqX38gRU/y+FBYTqkQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VxVVj8rb+t9ofX/c0YBsTap4G8+K6v07FC3orMKBOd8=;
	b=fQ1erxwpT0l11vOU1MPwP4UhY7/ny9yqHCve19/1Qfm62fjG0JQsYjXOMaIoJQGp
	tn4/vUOkRK8ZAn4If0paMXanJFdSAUrLsw0RCWwtDW3Tr4CpSU8g+azMG/uJ1ZF0eX+
	yCHCxNqda7GBdZ+9dc/ivytozqsj86merzdzY3bQ=
Content-Type: multipart/mixed; boundary="===============0535517255219275400=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.3.0 FAILED
Message-ID: <0101019c720efcb1-f1518fdf-a73f-4f0f-9838-aa20dd12984f-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231387

--===============0535517255219275400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.2.0-1.3.0.patch
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
From 279aa85994dd1c3d05b97951b0c8089aa4dd3509 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:36:06 +0000
Subject: [PATCH] virglrenderer: upgrade 1.2.0 -> 1.3.0

---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 57 -------------------
 ...uild-use-python3-directly-for-python.patch |  8 +--
 ...nderer_1.2.0.bb => virglrenderer_1.3.0.bb} |  3 +-
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.2.0.bb => virglrenderer_1.3.0.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
deleted file mode 100644
index b077bf2033..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c076c52a323584d6d00ca7079072cbc0dd88cb43 Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Fri, 7 Nov 2025 13:14:56 +1000
-Subject: [PATCH] c11/threads: fix build on c23
-
-C23/glibc is now including once_init in stdlib.h
-
-https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
-
-Just fix up our use of it.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mesa/compat/c11/threads_posix.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/mesa/compat/c11/threads_posix.h b/src/mesa/compat/c11/threads_posix.h
-index 45cb6075..071faf79 100644
---- a/src/mesa/compat/c11/threads_posix.h
-+++ b/src/mesa/compat/c11/threads_posix.h
-@@ -51,7 +51,9 @@ Configuration macro:
- #include <pthread.h>
- 
- /*---------------------------- macros ----------------------------*/
-+#ifndef __once_flag_defined
- #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
-+#endif
- #ifdef INIT_ONCE_STATIC_INIT
- #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
- #else
-@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
- typedef pthread_t       thrd_t;
- typedef pthread_key_t   tss_t;
- typedef pthread_mutex_t mtx_t;
-+#ifndef __once_flag_defined
- typedef pthread_once_t  once_flag;
--
-+#endif
- 
- /*
- Implementation limits:
-@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
- 
- /*--------------- 7.25.2 Initialization functions ---------------*/
- // 7.25.2.1
-+#ifndef __once_flag_defined
- static inline void
- call_once(once_flag *flag, void (*func)(void))
- {
-     pthread_once(flag, func);
- }
--
-+#endif
- 
- /*------------- 7.25.3 Condition variable functions -------------*/
- // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 6f0ba3ebab..c9854cdf6a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
+From dc2f270afadea25945a5aaf7d3acd88e3d49439e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 193ba32b..c01cae65 100644
+index 69c1bb82..08b1f266 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
@@ -23,5 +23,5 @@ index 193ba32b..c01cae65 100644
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- not_found = dependency('', required: false)
- gbm_dep = not_found
+ with_host_windows = host_machine.system() == 'windows'
+ with_host_darwin = host_machine.system() == 'darwin'
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
similarity index 90%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
index df8473dad2..8fcdddcc4b 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
-SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
+SRCREV = "ca50e008863837e094747a69974dde3ae148aeaa"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 inherit meson pkgconfig features_check
-- 
2.47.1


--===============0535517255219275400==
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
DISTRO_VERSION       = "5.3.99+snapshot-e3971f4b76a8de3b94e9328d14d51c08fe52f2d2"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e3971f4b76a8de3b94e9328d14d51c08fe52f2d2"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 254 Local 242 Mirrors 0 Missed 12 Current 673 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2342 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2399 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_write_config)
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2588 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_fetch)
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2589 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_unpack)
NOTE: Running task 2590 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2591 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_patch)
NOTE: Running task 2592 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2593 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2594 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2595 of 2607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure)
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/laye
 rs/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/buil
 d/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'libdrm', 'libepoxy', 'mesa', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'net
 tle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-cython-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-pyyaml-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'libyaml-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Main binary: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/recipe-sysroot-native/usr/bin/nativepython3
| Build Options: -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false -Dprefix=/usr -Dbindir=/usr/bin -Ddatadir=/usr/share -Dincludedir=/usr/include -Dinfodir=/usr/share/info -Dlibdir=/usr/lib -Dlibexecdir=/usr/libexec -Dlocalstatedir=/var -Dmandir=/usr/share/man -Dsbindir=/usr/sbin -Dsharedstatedir=/com -Dsysconfdir=/etc -Dbuildtype=plain -Dwrap_mode=nodownload --cross-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.cross --native-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.native
| Python system: Linux
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020, line 171
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020, line 160
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020, line 147
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020, line 184
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2595 tasks of which 2585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218153552.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218153552.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.1627020
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.3.0-r0 do_configure: meson setup failed
ERROR: virglrenderer-1.3.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.1627020' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.1627020
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure) failed with exit code '1'

--===============0535517255219275400==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.2.0-1.3.0.patch"

RnJvbSAyNzlhYTg1OTk0ZGQxYzNkMDViOTc5NTFiMGM4MDg5YWE0ZGQzNTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6MzY6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgotLS0KIC4uLm9uY2VfZmxhZy1P
TkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRjaCB8IDU3IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8ICA4ICstLQog
Li4ubmRlcmVyXzEuMi4wLmJiID0+IHZpcmdscmVuZGVyZXJfMS4zLjAuYmJ9IHwgIDMgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRl
cmVyLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXBy
ZXNlbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3t2
aXJnbHJlbmRlcmVyXzEuMi4wLmJiID0+IHZpcmdscmVuZGVyZXJfMS4zLjAuYmJ9ICg5MCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5k
ZXJlci8wMDAxLWMxMS11c2UtZ2xpYmMtcy1vbmNlX2ZsYWctT05DRV9GTEFHX0lOSVQtd2hlbi1w
cmVzZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJl
bmRlcmVyLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVu
LXByZXNlbi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjA3N2JmMjAzMy4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJn
bHJlbmRlcmVyLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13
aGVuLXByZXNlbi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDU3ICswLDAgQEAKLUZyb20gYzA3
NmM1MmEzMjM1ODRkNmQwMGNhNzA3OTA3MmNiYzBkZDg4Y2I0MyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci1EYXRlOiBGcmks
IDcgTm92IDIwMjUgMTM6MTQ6NTYgKzEwMDAKLVN1YmplY3Q6IFtQQVRDSF0gYzExL3RocmVhZHM6
IGZpeCBidWlsZCBvbiBjMjMKLQotQzIzL2dsaWJjIGlzIG5vdyBpbmNsdWRpbmcgb25jZV9pbml0
IGluIHN0ZGxpYi5oCi0KLWh0dHBzOi8vcGF0Y2h3b3JrLnNvdXJjZXdhcmUub3JnL3Byb2plY3Qv
Z2xpYmMvcGF0Y2gvNzgwNjEwODUtZjA0YS0wYzQ1LTEwN2ItNWE4YTE1NTIxMDgzQHJlZGhhdC5j
b20vIzIxMzA4OAotCi1KdXN0IGZpeCB1cCBvdXIgdXNlIG9mIGl0LgotCi1VcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3Zpcmds
cmVuZGVyZXIvLS9tZXJnZV9yZXF1ZXN0cy8xNTY3XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHNyYy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19w
b3NpeC5oIHwgOCArKysrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWVzYS9jb21wYXQvYzExL3RocmVhZHNf
cG9zaXguaCBiL3NyYy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19wb3NpeC5oCi1pbmRleCA0NWNi
NjA3NS4uMDcxZmFmNzkgMTAwNjQ0Ci0tLS0gYS9zcmMvbWVzYS9jb21wYXQvYzExL3RocmVhZHNf
cG9zaXguaAotKysrIGIvc3JjL21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmgKLUBAIC01
MSw3ICs1MSw5IEBAIENvbmZpZ3VyYXRpb24gbWFjcm86Ci0gI2luY2x1ZGUgPHB0aHJlYWQuaD4K
LSAKLSAvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gbWFjcm9zIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0qLwotKyNpZm5kZWYgX19vbmNlX2ZsYWdfZGVmaW5lZAotICNkZWZpbmUg
T05DRV9GTEFHX0lOSVQgUFRIUkVBRF9PTkNFX0lOSVQKLSsjZW5kaWYKLSAjaWZkZWYgSU5JVF9P
TkNFX1NUQVRJQ19JTklUCi0gI2RlZmluZSBUU1NfRFRPUl9JVEVSQVRJT05TIFBUSFJFQURfREVT
VFJVQ1RPUl9JVEVSQVRJT05TCi0gI2Vsc2UKLUBAIC02Niw4ICs2OCw5IEBAIHR5cGVkZWYgcHRo
cmVhZF9jb25kX3QgIGNuZF90OwotIHR5cGVkZWYgcHRocmVhZF90ICAgICAgIHRocmRfdDsKLSB0
eXBlZGVmIHB0aHJlYWRfa2V5X3QgICB0c3NfdDsKLSB0eXBlZGVmIHB0aHJlYWRfbXV0ZXhfdCBt
dHhfdDsKLSsjaWZuZGVmIF9fb25jZV9mbGFnX2RlZmluZWQKLSB0eXBlZGVmIHB0aHJlYWRfb25j
ZV90ICBvbmNlX2ZsYWc7Ci0tCi0rI2VuZGlmCi0gCi0gLyoKLSBJbXBsZW1lbnRhdGlvbiBsaW1p
dHM6Ci1AQCAtOTAsMTIgKzkzLDEzIEBAIGltcGxfdGhyZF9yb3V0aW5lKHZvaWQgKnApCi0gCi0g
LyotLS0tLS0tLS0tLS0tLS0gNy4yNS4yIEluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucyAtLS0tLS0t
LS0tLS0tLS0qLwotIC8vIDcuMjUuMi4xCi0rI2lmbmRlZiBfX29uY2VfZmxhZ19kZWZpbmVkCi0g
c3RhdGljIGlubGluZSB2b2lkCi0gY2FsbF9vbmNlKG9uY2VfZmxhZyAqZmxhZywgdm9pZCAoKmZ1
bmMpKHZvaWQpKQotIHsKLSAgICAgcHRocmVhZF9vbmNlKGZsYWcsIGZ1bmMpOwotIH0KLS0KLSsj
ZW5kaWYKLSAKLSAvKi0tLS0tLS0tLS0tLS0gNy4yNS4zIENvbmRpdGlvbiB2YXJpYWJsZSBmdW5j
dGlvbnMgLS0tLS0tLS0tLS0tLSovCi0gLy8gNy4yNS4zLjEKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWls
ZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1w
eXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXggNmYwYmEzZWJhYi4uYzk4NTRj
ZGY2YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRo
b24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xy
ZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUxYzhhNWE1NjhiMmNkMWRmY2I1M2VkM2I0OWEw
Zjg4OTliZTdiZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRjMmYyNzBhZmFkZWEy
NTk0NWE1YWFmN2QzYWNkODhlM2Q0OTQzOWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwg
NiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDog
dXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTkzYmEzMmIuLmMwMWNhZTY1IDEw
MDY0NAoraW5kZXggNjljMWJiODIuLjA4YjFmMjY2IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQK
ICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNzcsNyArNzcsNyBAQCBmbGFncyA9IFsKQEAgLTIzLDUg
KzIzLDUgQEAgaW5kZXggMTkzYmEzMmIuLmMwMWNhZTY1IDEwMDY0NAogLXByb2dfcHl0aG9uID0g
aW1wb3J0KCdweXRob24nKS5maW5kX2luc3RhbGxhdGlvbigncHl0aG9uMycpCiArcHJvZ19weXRo
b24gPSAncHl0aG9uMycKICAKLSBub3RfZm91bmQgPSBkZXBlbmRlbmN5KCcnLCByZXF1aXJlZDog
ZmFsc2UpCi0gZ2JtX2RlcCA9IG5vdF9mb3VuZAorIHdpdGhfaG9zdF93aW5kb3dzID0gaG9zdF9t
YWNoaW5lLnN5c3RlbSgpID09ICd3aW5kb3dzJworIHdpdGhfaG9zdF9kYXJ3aW4gPSBob3N0X21h
Y2hpbmUuc3lzdGVtKCkgPT0gJ2RhcndpbicKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMy4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXJfMS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKaW5kZXggZGY4NDczZGFkMi4uOGZj
ZGRkY2M0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
dmlyZ2xyZW5kZXJlcl8xLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xy
ZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMy4wLmJiCkBAIC05LDEwICs5LDkgQEAgTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODFjMDhlZWVm
ZDk0MThmY2E4Zjg4MzA5YTc2ZGIxMCIKIAogREVQRU5EUyA9ICJsaWJkcm0gbGliZXBveHkgcHl0
aG9uMy1weXlhbWwtbmF0aXZlIHZpcnR1YWwvZWdsIHZpcnR1YWwvbGliZ2JtIgotU1JDUkVWID0g
IjUwMGI0MWQ1Yzg2MzhmOWI4MGRkNTU4ZjQwNDRmMzMwMWM3NDU3YTQiCitTUkNSRVYgPSAiY2E1
MGUwMDg4NjM4MzdlMDk0NzQ3YTY5OTc0ZGRlM2FlMTQ4YWVhYSIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJlbmRlcmVyLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwczt0YWc9JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNv
bi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13
aGVuLXByZXNlbi5wYXRjaCBcCiAgICAgICAgICAgICIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25m
aWcgZmVhdHVyZXNfY2hlY2sKLS0gCjIuNDcuMQoK

--===============0535517255219275400==--

