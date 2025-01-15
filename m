Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF6CC02193
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.17878.1736936775124887247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BRkmwMDA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QKH8kYA+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194697fdb3f-70c89e13-668b-4a31-a8a4-86ec1440259b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936774;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fkKc6gXHQM0Qnji8frdaT/beuDR7MhsotReDgPxyGIw=;
	b=BRkmwMDAI86O0Y2yv5VXl9XxqEHQ4WQL6eX8cfMi5yrEYfXxn0ZwFphmFJYahrUV
	VJw2LMbky9VnZRDXGaMMIrJ/fY+SyuyP9E8wsLgzOnbxSOSnQOurA0Fn9PvQOStIs7Q
	vsaAcbAd518DI31KifRAqY9KBbnIeTJcA59mtybk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936774;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fkKc6gXHQM0Qnji8frdaT/beuDR7MhsotReDgPxyGIw=;
	b=QKH8kYA+7dU6Ls1lJbst1SYj7AIduzzVVQR04k1Br9goN3KwL1K0LOhTMd4fgpcQ
	x84Mvbk/JKHtd490vWaCCPkDtO3ZKsEoybql4N5dIiDdDeMjUmajn7ppwlpV9iMbPH+
	clKS0EMPS3sXyHZc09/pZq3EVhWlHCtrbn/3WFJ8=
Content-Type: multipart/mixed; boundary="===============3867623032339103203=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsecret: upgrading to 0.21.5 FAILED
Message-ID: <01010194697fdb3f-70c89e13-668b-4a31-a8a4-86ec1440259b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209864

--===============3867623032339103203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsecret* to *0.21.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.21.4-0.21.5.patch
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
From 80153331e01c5664fe1f4467e2e73ff0f3a258c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:46:24 +0000
Subject: [PATCH] libsecret: upgrade 0.21.4 -> 0.21.5

---
 .../0001-meson-add-option-to-disable-pam-tests.patch       | 7 ++-----
 .../libsecret/{libsecret_0.21.4.bb => libsecret_0.21.5.bb} | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.4.bb => libsecret_0.21.5.bb} (92%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
index 87ab8a32cd..fe4989abf9 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
@@ -1,4 +1,4 @@
-From b90ecbdb4b91961a77a7cbb3a9b6a57128e2194b Mon Sep 17 00:00:00 2001
+From 83edbbaab6380c8dbf70cd2bb07fe02e382fb2d0 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 3 Dec 2024 15:58:17 +0100
 Subject: [PATCH] meson: add option to disable pam tests
@@ -12,7 +12,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 24 insertions(+), 21 deletions(-)
 
 diff --git a/meson_options.txt b/meson_options.txt
-index 936eff8..8fa2a4e 100644
+index 936eff8..2ae14f2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -8,3 +8,4 @@ option('bashcompdir', type: 'string', value: '', description: 'Override default
@@ -75,6 +75,3 @@ index 8413b58..5155329 100644
 +    },
 +  )
 +endif
--- 
-2.47.0
-
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb
similarity index 92%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.5.bb
index d356681252..ef43849b8e 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 SRC_URI += "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] = "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c581301cd53912b20"
+SRC_URI[archive.sha256sum] = "08f45c44760ab4c2d6febd6e0eeb421663b29a72be52c48c61c507b0ef6a7920"
 
 EXTRA_OEMESON += "-Dpam-tests=false"
 
-- 
2.44.1


--===============3867623032339103203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1a551b25433c6406d0485bd3bafda2c6299e8f3a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 185 Local 173 Mirrors 0 Missed 12 Current 362 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_recipe_qa)
NOTE: Running task 1493 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_write_config)
NOTE: recipe libsecret-0.21.5-r0: task do_recipe_qa: Started
NOTE: recipe libsecret-0.21.5-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.5-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1550 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_fetch)
NOTE: recipe libsecret-0.21.5-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.5-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_unpack)
NOTE: Running task 1552 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.5-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.5-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_patch)
NOTE: Running task 1554 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.5-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.5-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1556 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_populate_lic)
NOTE: recipe libsecret-0.21.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.21.5-r0: task do_populate_lic: Started
NOTE: recipe libsecret-0.21.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1557 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_configure)
NOTE: recipe libsecret-0.21.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libsecret-0.21.5-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_popula
 te_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybu
 ild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'vala', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'linux-libc-headers', 'bash-completion', 'gdbm', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-install
 er-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true -Dgtk_doc=false -Dpam-tests=false -Dmanpage=false -Dpam=true...
| The Meson build system
| Version: 1.6.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/libsecret-0.21.5
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/build
| Build type: cross build
| Project name: libsecret
| Project version: 0.21.5
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/recipe-sysroot ld.bfd 2.43.1.20241111
| C compiler for the build machine: gcc (gcc 13.3.0 "gcc (GCC) 13.3.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240716
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency glib-2.0 found: YES 2.82.4
| Run-time dependency gio-2.0 found: YES 2.82.4
| Run-time dependency gio-unix-2.0 found: YES 2.82.4
| Run-time dependency libgcrypt found: YES 1.11.0-unknown
| Found CMake: NO
| Run-time dependency tss2-esys found: NO (tried pkgconfig and cmake)
| Run-time dependency tss2-mu found: NO (tried pkgconfig and cmake)
| Run-time dependency tss2-rc found: NO (tried pkgconfig and cmake)
| Run-time dependency tss2-tctildr found: NO (tried pkgconfig and cmake)
| Library m found: YES
| Checking for function "mlock" : YES
| Configuring config.h using configuration
| Program dbus-run-session found: NO
| 
| ../libsecret-0.21.5/meson.build:106:15: ERROR: Program 'dbus-run-session' not found or not executable
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182, line 155
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182, line 190
NOTE: recipe libsecret-0.21.5-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1557 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115084610.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115084610.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/log.do_configure.817182
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libsecret-0.21.5-r0 do_configure: meson failed
ERROR: libsecret-0.21.5-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/run.do_configure.817182' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.5/temp/log.do_configure.817182
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.5.bb:do_configure) failed with exit code '1'

--===============3867623032339103203==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.21.4-0.21.5.patch"

RnJvbSA4MDE1MzMzMWUwMWM1NjY0ZmUxZjQ0NjdlMmU3M2ZmMGYzYTI1OGM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6NDY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZWNyZXQ6IHVwZ3JhZGUgMC4yMS40IC0+IDAuMjEuNQoKLS0tCiAuLi4vMDAwMS1tZXNvbi1h
ZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoICAgICAgIHwgNyArKy0tLS0tCiAu
Li4vbGlic2VjcmV0L3tsaWJzZWNyZXRfMC4yMS40LmJiID0+IGxpYnNlY3JldF8wLjIxLjUuYmJ9
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC97bGlic2VjcmV0XzAuMjEuNC5i
YiA9PiBsaWJzZWNyZXRfMC4yMS41LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0LzAwMDEtbWVzb24tYWRkLW9wdGlvbi10by1kaXNh
YmxlLXBhbS10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2Vj
cmV0LzAwMDEtbWVzb24tYWRkLW9wdGlvbi10by1kaXNhYmxlLXBhbS10ZXN0cy5wYXRjaAppbmRl
eCA4N2FiOGEzMmNkLi5mZTQ5ODlhYmY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlic2VjcmV0L2xpYnNlY3JldC8wMDAxLW1lc29uLWFkZC1vcHRpb24tdG8tZGlzYWJsZS1wYW0t
dGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXQv
MDAwMS1tZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiOTBlY2JkYjRiOTE5NjFhNzdhN2NiYjNhOWI2YTU3MTI4ZTIxOTRiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4M2VkYmJhYWI2MzgwYzhkYmY3MGNkMmJiMDdm
ZTAyZTM4MmZiMmQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsg
PGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogVHVlLCAzIERlYyAyMDI0IDE1OjU4OjE3ICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBhZGQgb3B0aW9uIHRvIGRpc2FibGUgcGFtIHRlc3Rz
CkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9u
bGluZS5kZT4KICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb25fb3B0aW9ucy50eHQgYi9tZXNvbl9vcHRpb25zLnR4
dAotaW5kZXggOTM2ZWZmOC4uOGZhMmE0ZSAxMDA2NDQKK2luZGV4IDkzNmVmZjguLjJhZTE0ZjIg
MTAwNjQ0CiAtLS0gYS9tZXNvbl9vcHRpb25zLnR4dAogKysrIGIvbWVzb25fb3B0aW9ucy50eHQK
IEBAIC04LDMgKzgsNCBAQCBvcHRpb24oJ2Jhc2hjb21wZGlyJywgdHlwZTogJ3N0cmluZycsIHZh
bHVlOiAnJywgZGVzY3JpcHRpb246ICdPdmVycmlkZSBkZWZhdWx0CkBAIC03NSw2ICs3NSwzIEBA
IGluZGV4IDg0MTNiNTguLjUxNTUzMjkgMTAwNjQ0CiArICAgIH0sCiArICApCiArZW5kaWYKLS0t
IAotMi40Ny4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGli
c2VjcmV0XzAuMjEuNC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0
XzAuMjEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z25vbWUvbGlic2VjcmV0L2xpYnNlY3JldF8wLjIxLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0XzAuMjEuNS5iYgppbmRleCBkMzU2NjgxMjUyLi5l
ZjQzODQ5YjhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNl
Y3JldF8wLjIxLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNy
ZXRfMC4yMS41LmJiCkBAIC0xNCw3ICsxNCw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dl
biB2YWxhIGdvYmplY3QtaW50cm9zcGVjdGlvbiBtYW5wYWdlcwogREVQRU5EUyArPSAiZ2xpYi0y
LjAgbGliZ2NyeXB0IGdldHRleHQtbmF0aXZlIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1t
ZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiMTYzZDA4ZDc4M2JlNmQ0YWI5YTk3OWNlYjVhNGZlY2JjMWQ5NjYw
ZDNjMzQxNjhjNTgxMzAxY2Q1MzkxMmIyMCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjA4ZjQ1YzQ0NzYwYWI0YzJkNmZlYmQ2ZTBlZWI0MjE2NjNiMjlhNzJiZTUyYzQ4YzYxYzUwN2Iw
ZWY2YTc5MjAiCiAKIEVYVFJBX09FTUVTT04gKz0gIi1EcGFtLXRlc3RzPWZhbHNlIgogCi0tIAoy
LjQ0LjEKCg==

--===============3867623032339103203==--

