Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3FE61858
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 14:17:34 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id du17so1760944qvb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xVphXvGEViozq7gsj47CMDesWvkXjYO0Atxf+kf8ohs=;
	b=B/2D4PADXSiDXJQ5jJpzshQngKx8eOs5dzHBxZ/bbwKOJy2W6hJxZAKTDpfsGTgwIH
	O+vOvn5fbpiSftBlp403bsQ/JXzMtWkXLbixwvWcKx8aanI8P6I5A5fg4SxOyQufQC4d
	l/25Ce6Xvg0oxDfS+QBARMRHsm1LGz0l9goz6TyXI9txL41QVWDhJjNN7dTe1jbAGKhi
	Bn7/50tHiNVqVEvloG7VXT+nx/BnJSOnBT1DV8LBHluI+ZW9qj+O+VhLoz1i3+UBF1EH
	zyZTyTFTHfxdsAU3P2pvaboA5+/UfdcVp/Qzqtdnyvwke/rTD3olGu0DbuKfGnpVNWIq
	cYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xVphXvGEViozq7gsj47CMDesWvkXjYO0Atxf+kf8ohs=;
	b=m7r3ko2Np3VJ2nPzBKCBfQhCjKeIITUK36mUsJBxe39BT3JX9qVOGNyt8xDbSbgFBM
	Mw0z8PQy4G5VNhWMaRN/WpFAjzcBSxFZiYu+mTGcsuPWn6JkOxGlyJf9wTzWJwUwB6Gt
	nHu8WzQYb51x/5YBHExk+KrtqL+R/5gG16TMTmWDS7OPPG+b7GCs7o2NP247h8+T3P/0
	rgQmtkqsKOeu7dpVBAl4tA9NuVW2DaoOGN8H4be0iCP4gjsYvavJblLp0k6meyV3WCiM
	1uLB5WsrgvjX3G0nE3b4BgL5MRGMqtwaZ1QtC5qZA3xWEiGyy4DSg62YsWDNvUan70Hf
	zsmA==
X-Gm-Message-State: ANhLgQ1ytX0G1/joY+TmqhQdPjW32J9Fgmm8NbFkQflqNfLGvt5ee78i
	+yvKTJbDgpoK/Jgn6DlM9pjU/yK0Kfm5pgYaYEs=
X-Google-Smtp-Source: ADFU+vseGfJoJ2iCzdYOHxBPz9y+f54xtvFSdMW0vf2MpuywITTdyaDcsj6uRozML5sGV21uIJ5k+B5UnOKmdIv54NI=
X-Received: by 2002:a05:6214:6f0:: with SMTP id
	bk16mr7493805qvb.23.1583590655418; 
	Sat, 07 Mar 2020 06:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20200305120629.329-1-wallinux@gmail.com>
In-Reply-To: <20200305120629.329-1-wallinux@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Mar 2020 06:17:09 -0800
Message-ID: <CAMKF1sqjUDE2Lxe5saLRc-o8Qpe=suQavaAC1Vr7V9-PtK7qRQ@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] babeltrace2: added first version, 2.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Mar 2020 14:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing a QA textrel issue with clang/arm

http://errors.yoctoproject.org/Errors/Details/393983/

On Thu, Mar 5, 2020 at 4:07 AM Anders Wallin <wallinux@gmail.com> wrote:
>
> Babeltrace 1 vs. Babeltrace 2
>
> The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was released.
> Babeltrace 2 is a complete rewrite of the library, Python bindings, and CLI. It
> is plugin based and offers much more features and potential than Babeltrace 1.
>
> Because Babeltrace 2 is still a young released project, some distributions still
> provide packages for the Babeltrace 1 project. Both projects can coexist on the
> same system as there are no common installed files.
>
> Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ---
>  meta/conf/distro/include/distro_alias.inc     |  1 +
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../packagegroup-core-tools-profile.bb        |  2 +
>  ...not-run-test-applications-from-.libs.patch | 28 ++++++
>  .../lttng/babeltrace2/run-ptest               |  9 ++
>  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 92 +++++++++++++++++++
>  7 files changed, 134 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
>  create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index 79ebcaee29..0e4a9a9f8f 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -15,6 +15,7 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
>  DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
>  DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
>  DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
> +DISTRO_PN_ALIAS_pn-babeltrace2 = "OSPDT"
>  DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
>  DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
>  DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 10095ffe76..adb18228e7 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -59,6 +59,7 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER_pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 4afac58e3a..d6f3aafc7f 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -64,6 +64,7 @@ PTESTS_FAST = "\
>
>  PTESTS_SLOW = "\
>      babeltrace-ptest \
> +    babeltrace2-ptest \
>      busybox-ptest \
>      dbus-test-ptest \
>      e2fsprogs-ptest \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 984c2fac92..ac180b542a 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -46,6 +46,7 @@ LTTNGMODULES = "lttng-modules"
>  LTTNGMODULES_arc = ""
>
>  BABELTRACE = "babeltrace"
> +BABELTRACE2 = "babeltrace2"
>
>  # valgrind does not work on the following configurations/architectures
>
> @@ -69,6 +70,7 @@ RDEPENDS_${PN} = "\
>      ${LTTNGTOOLS} \
>      ${LTTNGMODULES} \
>      ${BABELTRACE} \
> +    ${BABELTRACE2} \
>      ${SYSTEMTAP} \
>      ${VALGRIND} \
>      "
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> new file mode 100644
> index 0000000000..805dde8064
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> @@ -0,0 +1,28 @@
> +From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
> +Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
> +From: Anders Wallin <wallinux@gmail.com>
> +Date: Thu, 5 Mar 2020 11:20:04 +0100
> +Subject: [PATCH] tests: do not run test applications from .libs
> +
> +Cross compile specific change
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Anders Wallin <wallinux@gmail.com>
> +---
> + tests/lib/test_plugin | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
> +index 652c90cc..1f817c50 100755
> +--- a/tests/lib/test_plugin
> ++++ b/tests/lib/test_plugin
> +@@ -26,4 +26,4 @@ fi
> + # shellcheck source=../utils/utils.sh
> + source "$UTILSSH"
> +
> +-"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
> ++"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> new file mode 100755
> index 0000000000..72fe223436
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +# use target=recheck if you want to recheck failing tests
> +[ "$target" = "" ] && target=check
> +
> +# Without --ignore-exit, the tap harness causes any FAILs within a
> +# test plan to raise ERRORs; this is just noise.
> +makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
> +
> +exec make -C tests -k -s $makeargs $target 2>/dev/null
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> new file mode 100644
> index 0000000000..16953d6807
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> @@ -0,0 +1,92 @@
> +SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
> +DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
> +HOMEPAGE = "http://babeltrace.org/"
> +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> +LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
> +
> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> +
> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
> +          file://run-ptest \
> +          file://0001-tests-do-not-run-test-applications-from-.libs.patch \
> +         "
> +SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig ptest
> +
> +EXTRA_OECONF = "--disable-debug-info"
> +
> +PACKAGECONFIG ??= "manpages"
> +PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
> +
> +FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
> +FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
> +
> +ASNEEDED = ""
> +
> +RDEPENDS_${PN}-ptest += "bash gawk python3"
> +
> +do_compile_ptest () {
> +    make -C tests all
> +}
> +
> +do_install_ptest () {
> +    install -d "${D}${PTEST_PATH}/tests"
> +
> +    # Copy required files from source directory
> +    for d in $(find "${S}/tests" -type d -printf '%P ') ; do
> +       install -d "${D}${PTEST_PATH}/tests/$d"
> +       find "${S}/tests/$d" -maxdepth 1 -executable -type f \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
> +       find "${S}/tests/$d" -maxdepth 1 -name *.sh \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +       find "${S}/tests/$d" -maxdepth 1 -name *.py \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +       find "${S}/tests/$d" -maxdepth 1 -name *.expect \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +    done
> +    install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
> +    cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
> +
> +    # Copy the tests directory tree and the executables and
> +    # Makefiles found within.
> +    install -D "${B}/tests/Makefile" "${D}${PTEST_PATH}/tests/"
> +    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ') ; do
> +       install -d "${D}${PTEST_PATH}/tests/$d"
> +       find "${B}/tests/$d" -maxdepth 1 -executable -type f \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
> +       test -r "${B}/tests/$d/Makefile" && \
> +           install -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
> +       find "${B}/tests/$d" -maxdepth 1 -name *.sh \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +    done
> +
> +    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
> +       for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
> +           cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
> +       done
> +    done
> +
> +    # Prevent attempts to update Makefiles during test runs, and
> +    # silence "Making check in $SUBDIR" messages.
> +    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
> +        sed -i \
> +        -e '/Makefile:/,/^$/d' \
> +        -e '/%: %.in/,/^$/d' \
> +        -e '/echo "Making $$target in $$subdir"; \\/d' \
> +        -e 's/^srcdir = \(.*\)/srcdir = ./' \
> +        -e 's/^builddir = \(.*\)/builddir = ./' \
> +        -e 's/^all-am:.*/all-am:/' \
> +        {} +
> +
> +    # Substitute links to installed binaries.
> +    install -d "${D}${PTEST_PATH}/src/cli/"
> +    ln -s "${bindir}/babeltrace2" ${D}${PTEST_PATH}/src/cli/
> +
> +    # Remove architechture specific testfiles
> +    rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
> +}
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

