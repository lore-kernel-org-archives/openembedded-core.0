Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC02DC38A2C
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.477.1664643227360035497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P/x3iz1i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477e476-bd4799b3-e697-4ef6-9970-55949ba0869f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iGQmRe6w+sAxQfqNLR2uUHj8px8sAFn5M3q8GgaiJbE=;
	b=P/x3iz1iZiZpkqdSDYt1qUkgO3sPzEShS5HPY2zNg+q9eSe0XjQrxPNZhbAr5K4D
	cYQDqmTvl88sG4wvnoq7QLEmEa19EVCK0VgBCMwU0iicbiZpKdy4LwUb50BMHR4gER0
	7pBzwLvFb6Ho0ZtWhbwHvSTQL830pF2+uyDFL+8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iGQmRe6w+sAxQfqNLR2uUHj8px8sAFn5M3q8GgaiJbE=;
	b=WM1ZTogAVyUAEOoWPsw1sXbLQ41lorRVWfjKf9lpfYc0J9gWyRAz5ueaziUXLl13
	WcMAKjf3D2SFPr2MICBJ4iHXafOT0onqtCG7PU6pfrkg+411VXQL+nnxRgXnewul139
	gCrIlFFBZBtAGbvuxiWMiOyI2nQqEzUzSqp35IXE=
Content-Type: multipart/mixed; boundary="===============4792951325008292808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] flac: upgrading to 1.4.1 FAILED
Message-ID: 
 <010101839477e476-bd4799b3-e697-4ef6-9970-55949ba0869f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171325

--===============4792951325008292808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *flac* to *1.4.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-flac-upgrade-1.4.0-1.4.1.patch
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
--===============4792951325008292808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-flac-upgrade-1.4.0-1.4.1.patch"

RnJvbSBjNjZkNzYxNDM3ZjRhOGQxNGYwMjIxZWIxZTJhY2YxZDFjZWUyMzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNDoxNTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZs
YWM6IHVwZ3JhZGUgMS40LjAgLT4gMS40LjEKCi0tLQogbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
ZmxhYy97ZmxhY18xLjQuMC5iYiA9PiBmbGFjXzEuNC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2ZsYWMve2ZsYWNfMS40LjAuYmIgPT4gZmxhY18xLjQuMS5iYn0gKDk1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS40LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS40LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEuNC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS40LjEuYmIK
aW5kZXggMzYwMzk2MzgwZC4uMTJmMGVjNjE1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZmxhYy9mbGFjXzEuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2ZsYWMvZmxhY18xLjQuMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HLkZETDttZDU9YWQxNDE5ZWNjNTZlMDYwZWNjZjgxODRhODdjNDI4NWYg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaW5jbHVkZS9GTEFDL2FsbC5oO2JlZ2lubGlu
ZT02NTtlbmRsaW5lPTcwO21kNT02NDQ3NGYyYjIyZTllNzdiMjhkOGI4YjI1Yzk4M2E0OCIKIAog
U1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWRzLnhpcGgub3JnL3JlbGVhc2VzL2ZsYWMvJHtCUH0u
dGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFmNDFjMDczM2M5M2MyMzdjM2U1MmY2NGRk
ODdlM2IwZDlhZjM4MjU5ZjFjN2QxMWU4Y2JmNTgzYzQ4YzI1MDYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTEzMDNjM2U1ZGZkZTUyYzNlOTRlNzU5NzZjMGFiM2VlMTRjZWQyNzhhYjhmNjAwMzNh
M2ExMmRiOTIwOWFlNiIKIAogQ1ZFX1BST0RVQ1QgPSAibGliZmxhYyBmbGFjIgogCi0tIAoyLjMx
LjEKCg==

--===============4792951325008292808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddc730ab4bad65016fe775a2c24088bb15a93441"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 36 Mirrors 0 Missed 7 Current 118 (83% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 625 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_fetch)
NOTE: recipe flac-1.4.1-r0: task do_fetch: Started
NOTE: recipe flac-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 653 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_unpack)
NOTE: Running task 654 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.1-r0: task do_unpack: Started
NOTE: recipe flac-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_patch)
NOTE: recipe flac-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.1-r0: task do_patch: Started
NOTE: recipe flac-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 657 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_populate_lic)
NOTE: recipe flac-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.1-r0: task do_populate_lic: Started
NOTE: recipe flac-1.4.1-r0: task do_populate_lic: Succeeded
NOTE: recipe flac-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 658 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_configure)
NOTE: recipe flac-1.4.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sys
 root', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'libogg', 'gettext-native', 'autoconf-native', 'automake-native', 'patch-native', 'pseudo-native', 'xz-native', 'gettext-minimal-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'mpfr-native', 'zlib-native', 'gmp-native', 'zstd-native', 'gnu-config-native', 'libmpc-native', 'flex-native', 'linux-libc-headers', 'attr-native', 'm4-native', 'libgcc']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/flac-1.4.1/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/flac-1.4.1/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/flac-1.4.1/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/flac-1.4.1/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| configure.ac:379: warning: cannot check for file existence when cross compiling
| ../autoconf-2.71/lib/autoconf/general.m4:3010: AC_CHECK_FILE is expanded from...
| configure.ac:379: the top level
| configure.ac:380: warning: cannot check for file existence when cross compiling
| ../autoconf-2.71/lib/autoconf/general.m4:3010: AC_CHECK_FILE is expanded from...
| configure.ac:380: the top level
| configure.ac:486: warning: cannot check for file existence when cross compiling
| ../autoconf-2.71/lib/autoconf/general.m4:3010: AC_CHECK_FILE is expanded from...
| configure.ac:486: the top level
| configure.ac:487: warning: cannot check for file existence when cross compiling
| ../autoconf-2.71/lib/autoconf/general.m4:3010: AC_CHECK_FILE is expanded from...
| configure.ac:487: the top level
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/flac-1.4.1/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:39: installing './compile'
| configure.ac:26: installing './missing'
| examples/c/decode/file/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../flac-1.4.1/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot --disable-oggtest                 --disable-xmms-plugin                 --without-libiconv-prefix                 ac_cv_prog_NASM=                  --disable-static  --disable-altivec --disable-avx --enable-ogg --with-ogg-libraries=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0
 /recipe-sysroot/usr/lib --with-ogg-includes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot/usr/include --enable-sse --disable-vsx --enable-nls
| configure: WARNING: unrecognized options: --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether configure should try to set CFLAGS/CXXFLAGS/CPPFLAGS/LDFLAGS... no
| checking whether to enable debugging... no
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking the archiver (i686-poky-linux-gcc-ar) interface... ar
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... (cached) i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot... none
| checking whether the compiler supports GNU C++... yes
| checking whether i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot option to enable C++11 features... none needed
| checking dependency style of i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot... none
| checking how to run the C++ preprocessor... i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot -E
| checking for ld used by i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot  ) is GNU ld... yes
| checking whether the i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot  ) supports shared libraries... yes
| checking for i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/recipe-sysroot  ) supports shared libraries... yes
| checking dynamic linker characteristics... (cached) GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether we are using the CLANG C compiler... no
| checking whether make sets $(MAKE)... (cached) yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking for _LARGEFILE_SOURCE value needed for large files... no
| checking size of off_t... 8
| checking size of void*... 4
| checking for library containing lround... -lm
| checking for inline... inline
| checking for typeof syntax and keyword spelling... typeof
| checking for stdint.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for byteswap.h... yes
| checking for sys/auxv.h... yes
| checking for sys/param.h... yes
| checking for sys/ioctl.h... yes
| checking for termios.h... yes
| checking for x86intrin.h... yes
| checking for cpuid.h... yes
| checking for arm_neon.h... no
| checking for bswap32 intrinsic... yes
| checking for bswap16 intrinsic... yes
| checking whether byte ordering is bigendian... (cached) no
| checking for socklen_t... yes
| checking for getauxval... yes
| checking for getopt_long... yes
| checking size of void*... (cached) 4
| checking for doxygen... no
| checking for ../flac-1.4.1/doc/FLAC.tag... configure: error: cannot check for file existence when cross compiling
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351:287 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351, line 287
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351, line 263
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351, line 233
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351, line 153
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351, line 291
NOTE: recipe flac-1.4.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 658 tasks of which 651 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: flac-1.4.1-r0 do_configure: configure failed
ERROR: flac-1.4.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/run.do_configure.127351', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/flac/1.4.1-r0/temp/log.do_configure.127351
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.1.bb:do_configure) failed with exit code '1'

--===============4792951325008292808==--

