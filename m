Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 381E860268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 11:39:19 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s140so17328024qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 03:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZdMIq+HzeB9SkoV+Ra6ccdbfEFixgTPwdbltcmBoEIA=;
	b=c2lW5cN2zyehVbI1JqwdSavKg+DaYEO73tREvdn99Mxz10o+9UKStr1gwPONgX7eJ7
	tbOXPhgJ+vLA+6N1XOkGGodF64V5Xvhph+UpwC7J/EXjGgLQ37HTWb8ZlXQa+au5hnuC
	J7SnbFx+TBd7ViEID3GnkqmJJpPJY93FsEjqHpCewAbtHsiCLw3Y/k9Z+k6JuOkrwlK8
	FDtVb8zoNEL65tZr4LYY3/IpFomuO+QzTNn4vzJb7PcJO5BfXLDH0cibOKNpCQ0CB9gG
	VhLnx61uJonBLtd9RbMiEl5IbULgFW7SDrC0Vzsi5KIAI8i8JWNj2U2hONrhdQlUnKOA
	6hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZdMIq+HzeB9SkoV+Ra6ccdbfEFixgTPwdbltcmBoEIA=;
	b=rXS9lvvgHBM/WQiq1F4kRHmT7X0jKvyLPMKzVgLnGu62iLLLlehYo4+P4e5dYpSj1i
	/n6RX/TigAULbIilWb9qwF1iO/4zKh3dQS9Ao5PfNPn6HpLxesK09AgcbRjrUhR/+3d2
	BEaiyCfckwbgppDAT6CUiyHBeaNqapscEPv3Ed8BBDzCvGoprS0F54JPAQlkpmWA//84
	dtuGmZkqRMX+3j0Oxkk32w99SdcPI1638zg5ebu44coOX0lIYm4dJwLNLAe+dpfAa+Bx
	i6m0ti3tr619jyqfxZKUZ9EPEhTGr07MAYD/pzqrcv4xoee2j9FrgijE9JANOAz0/CDS
	dsVw==
X-Gm-Message-State: AIkVDXIuDbH5HxSGNDAqixOCtECU8DEw5xzVnX3Bo85ihtzFWTqwL9MT+HGS4tTHIpaEp4EXAhdOz3XPNb8Bk1Na
X-Received: by 10.55.130.4 with SMTP id e4mr13742981qkd.121.1484221159843;
	Thu, 12 Jan 2017 03:39:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 03:38:59 -0800 (PST)
In-Reply-To: <1484089620-19725-5-git-send-email-nathan_lynch@mentor.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
	<1484089620-19725-5-git-send-email-nathan_lynch@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 11:38:59 +0000
Message-ID: <CAJTo0LZKcoocQ3wBjG78jakD6wsJE79Cnkq5N1n5hkv__8WmEw@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] lttng-tools: upgrade to 2.9.3
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
X-List-Received-Date: Thu, 12 Jan 2017 11:39:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c070356006cdc0545e42b7c

--94eb2c070356006cdc0545e42b7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

This upgrade is failing on the autobuilders:

DEBUG: Executing shell function do_install_ptest_base
install: failed to access
=E2=80=98TOPDIR/tmp/work/mips64-poky-linux/lttng-tools/2.9.3-r0/image/usr/l=
ib/lttng-tools/ptest/tests/destructive=E2=80=99:
No such file or directory

Ross


On 10 January 2017 at 23:06, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Notable recipe changes:
>
> * switch to using release tarball
> * brokensep no longer required
> * drop upstreamed error.h patch
> * change do_install_ptest to selectively copy build artifacts to
>   install tree.
> * use backported patch to address file-rdeps warning
>
> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> ---
>  .../0001-Fix-error.h-common-error.h.patch          |  33 -----
>  meta/recipes-kernel/lttng/lttng-tools/run-ptest    |   5 +-
>  .../utils-remove-bogus-interpreter.patch           |  35 +++++
>  .../{lttng-tools_git.bb =3D> lttng-tools_2.9.3.bb}   | 142
> +++++++++++----------
>  4 files changed, 112 insertions(+), 103 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/
> lttng-tools/0001-Fix-error.h-common-error.h.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-
> bogus-interpreter.patch
>  rename meta/recipes-kernel/lttng/{lttng-tools_git.bb =3D>
> lttng-tools_2.9.3.bb} (39%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-commo=
n-error.h.patch
> b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-
> common-error.h.patch
> deleted file mode 100644
> index 6c8a9b211a08..000000000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-
> common-error.h.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 6712db617fe9155ea236f6840c2bd18dbec4c871 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Wed, 15 Jun 2016 17:18:03 -0400
> -Subject: [PATCH] Fix: error.h -> common/error.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
> -Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> ----
> - src/bin/lttng-sessiond/agent.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/bin/lttng-sessiond/agent.c b/src/bin/lttng-sessiond/
> agent.c
> -index 7cbbbde..310a7e8 100644
> ---- a/src/bin/lttng-sessiond/agent.c
> -+++ b/src/bin/lttng-sessiond/agent.c
> -@@ -29,7 +29,7 @@
> - #include "agent.h"
> - #include "ust-app.h"
> - #include "utils.h"
> --#include "error.h"
> -+#include "common/error.h"
> -
> - #define AGENT_RET_CODE_INDEX(code) (code - AGENT_RET_CODE_SUCCESS)
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> index 6230063442d6..705030ee53b8 100755
> --- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> +++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> @@ -1,5 +1,6 @@
>  #!/bin/sh
>  # Without --ignore-exit, the tap harness causes any FAILs within a
>  # test plan to raise ERRORs; this is just noise.
> -makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit"
> -make -t all >/dev/null 2>&1 && exec make -s $makeargs check 2>/dev/null
> +makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit top_srcdir=3D$PWD
> top_builddir=3D$PWD"
> +make -k -t all >/dev/null 2>&1
> +exec make -s $makeargs check 2>/dev/null
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-int=
erpreter.patch
> b/meta/recipes-kernel/lttng/lttng-tools/utils-remove-
> bogus-interpreter.patch
> new file mode 100644
> index 000000000000..f08198208d4f
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/utils-remove-
> bogus-interpreter.patch
> @@ -0,0 +1,35 @@
> +From 4545eae3bccb0f5a97509d1405a28000029a8d7d Mon Sep 17 00:00:00 2001
> +From: Nathan Lynch <nathan_lynch@mentor.com>
> +Date: Mon, 9 Jan 2017 16:14:28 -0600
> +Subject: [PATCH] lttng-tools: remove bogus interpreter line from utils
> shell
> + library
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +tests/utils/utils.sh is always sourced, never executed, and
> +/src/bin/bash is not a typical path for a shell interpreter.  Just
> +delete it.
> +
> +Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> +Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
> +---
> +
> +Upstream-Status: Backport
> +
> + tests/utils/utils.sh | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
> +index 05d88650e9f3..9db0640b70f3 100644
> +--- a/tests/utils/utils.sh
> ++++ b/tests/utils/utils.sh
> +@@ -1,5 +1,3 @@
> +-#!/src/bin/bash
> +-#
> + # Copyright (C) - 2012 David Goulet <dgoulet@efficios.com>
> + #
> + # This library is free software; you can redistribute it and/or modify
> it under
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb
> b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
> similarity index 39%
> rename from meta/recipes-kernel/lttng/lttng-tools_git.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
> index 29fd75b21705..0506feb0136c 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
> @@ -15,9 +15,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl bash gawk ${PN}
> babeltrace procps"
>  # babelstats.pl wants getopt-long
>  RDEPENDS_${PN}-ptest +=3D "perl-module-getopt-long"
>
> -SRCREV =3D "d11e0dba0df9024b8613c51e167a379b91e8b20b"
> -PV =3D "2.8.1+git${SRCPV}"
> -
>  PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SITEPACKAGES_DIR}'=
 \
>                   am_cv_python_pythondir=3D'${PYTHON_SITEPACKAGES_DIR}' \
>                   PYTHON_INCLUDE=3D'-I${STAGING_INCDIR}/python${PYTHON_BA=
SEVERSION}${PYTHON_ABI}'
> \
> @@ -29,14 +26,15 @@ PACKAGECONFIG[kmod] =3D "--enable-kmod, --disable-kmo=
d,
> kmod"
>  PACKAGECONFIG[manpages] =3D "--enable-man-pages, --disable-man-pages,
> asciidoc-native xmlto-native libxslt-native"
>  PACKAGECONFIG_remove_libc-musl =3D "lttng-ust"
>
> -SRC_URI =3D "git://git.lttng.org/lttng-tools.git;branch=3Dstable-2.8 \
> -           file://0001-Fix-error.h-common-error.h.patch \
> +SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.b=
z2
> \
>             file://x32.patch \
> +           file://utils-remove-bogus-interpreter.patch \
>             file://run-ptest"
>
> -S =3D "${WORKDIR}/git"
> +SRC_URI[md5sum] =3D "19fdcc5e9c307ef66581a2743a08a541"
> +SRC_URI[sha256sum] =3D "a6e6baaaa977dcbc9bce6b675881ee
> c664599b86f0d905a7b0b508539407b24e"
>
> -inherit autotools-brokensep ptest pkgconfig useradd python3-dir manpages
> +inherit autotools ptest pkgconfig useradd python3-dir manpages
>
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "tracing"
> @@ -53,68 +51,76 @@ INSANE_SKIP_${PN} =3D "libexec dev-so"
>  INSANE_SKIP_${PN}-dbg =3D "libexec"
>
>  do_configure_prepend () {
> -       # Delete a shipped m4 file that overrides our patched one
> -       rm -f ${S}/m4/libxml.m4
> +    # Delete a shipped m4 file that overrides our patched one
> +    rm -f ${S}/m4/libxml.m4
>  }
>
>  do_install_ptest () {
> -       mkdir -p ${D}${PTEST_PATH}
> -
> -       cp -a -T ${B} ${D}${PTEST_PATH}
> -
> -       # Prevent attempts to update Makefiles during test runs, and
> -       # silence "Making check in $SUBDIR" messages.
> -       find ${D}${PTEST_PATH} -name Makefile -type f -exec \
> -               sed -i -e 's!^Makefile:!_Makefile:!' \
> -               -e '/echo "Making $$target in $$subdir"; \\/d' {} +
> -
> -       # Prevent attempts to update version.h during test runs.
> -       sed -i -e '/^\.PHONY: version\.h$/d' ${D}${PTEST_PATH}/include/
> Makefile
> -
> -       # Silence "Making check in $SUBDIR" messages.
> -       find ${D}${PTEST_PATH} -name Makefile -type f -exec \
> -               sed -i -e '/echo "Making $$target in $$subdir"; \\/d' {} =
+
> -
> -       # Substitute links to installed binaries.
> -       for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; d=
o
> -               orig=3D"${D}${PTEST_PATH}/src/bin/${prog}/${prog}"
> -               rm "$orig"
> -               case "$prog" in
> -                       lttng-consumerd)
> -                               ln -s "${libdir}/lttng/libexec/$prog"
> "$orig"
> -                               ;;
> -                       *)
> -                               ln -s "${bindir}/$prog" "$orig"
> -                               ;;
> -               esac
> -       done
> -
> -       # Remove libtool artifacts.
> -       find ${D}${PTEST_PATH} \( -name '*.l[ao]' -o -name '*.lai' \)
> -delete
> -
> -       # Remove object files and archives.
> -       find ${D}${PTEST_PATH} -name '*.[oa]' -type f -delete
> -
> -       # Remove Makefile.am and Makefile.in.
> -       find ${D}${PTEST_PATH} -name 'Makefile.*' -type f -delete
> -
> -       # Remove autom4te.cache.
> -       rm -rf ${D}${PTEST_PATH}/autom4te.cache
> -
> -       # Replace libtool wrapper scripts (which won't work on the
> -       # target) with their corresponding binaries.
> -       for prog in unit/ini_config/ini_config \
> -               regression/tools/live/live_test \
> -               regression/tools/health/health_check ; do
> -               basename=3D${prog##*/}
> -               ldir=3D${D}${PTEST_PATH}/tests/${prog%/*}
> -               mv -f ${ldir}/.libs/${basename} ${ldir}
> -       done
> -
> -       # checkpatch.pl is unneeded on target and causes file-rdeps QA
> -       # warnings.
> -       rm -f ${D}${PTEST_PATH}/extras/checkpatch.pl
> -
> -        # Remove built libraries as they confuse the packages' runtime
> dependency resolution
> -        rm -rf ${D}${PTEST_PATH}/src/lib/lttng-ctl/.libs/
> +    for f in Makefile tests/Makefile tests/utils/utils.sh ; do
> +        install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
> +    done
> +
> +    for f in config/tap-driver.sh config/test-driver ; do
> +        install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
> +    done
> +
> +    # Prevent 'make check' from recursing into non-test subdirectories.
> +    sed -i -e 's!^SUBDIRS =3D .*!SUBDIRS =3D tests!'
> "${D}${PTEST_PATH}/Makefile"
> +
> +    # We don't need these
> +    sed -i -e '/dist_noinst_SCRIPTS =3D /,/^$/d' "${D}${PTEST_PATH}/test=
s/
> Makefile"
> +
> +    # We shouldn't need to build anything in tests/utils
> +    sed -i -e 's!am__append_1 =3D . utils!am__append_1 =3D . !' \
> +        "${D}${PTEST_PATH}/tests/Makefile"
> +
> +    # Copy the tests directory tree and the executables and
> +    # Makefiles found within.
> +    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ')
> ; do
> +        find "${B}/tests/$d" -maxdepth 1 -executable -type f \
> +            -exec install -D -t "${D}${PTEST_PATH}/tests/$d" {} +
> +        test -r "${B}/tests/$d/Makefile" && \
> +            install -D -t "${D}${PTEST_PATH}/tests/$d"
> "${B}/tests/$d/Makefile"
> +    done
> +
> +    # We shouldn't need to build anything in tests/regression/tools
> +    sed -i -e 's!^SUBDIRS =3D tools !SUBDIRS =3D !' \
> +        "${D}${PTEST_PATH}/tests/regression/Makefile"
> +
> +    # Prevent attempts to update Makefiles during test runs, and
> +    # silence "Making check in $SUBDIR" messages.
> +    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
> +        sed -i -e '/Makefile:/,/^$/d' -e '/%: %.in/,/^$/d' \
> +        -e '/echo "Making $$target in $$subdir"; \\/d' \
> +        -e 's/^srcdir =3D \(.*\)/srcdir =3D ./' \
> +        -e 's/^builddir =3D \(.*\)/builddir =3D ./' \
> +        -e 's/^all-am:.*/all-am:/' \
> +        {} +
> +
> +    # These objects trigger [rpaths] QA checks; the test harness
> +    # skips the associated tests if they're missing, so delete
> +    # them.
> +    objs=3D""
> +    objs=3D"$objs regression/ust/ust-dl/libbar.so"
> +    objs=3D"$objs regression/ust/ust-dl/libfoo.so"
> +    for obj in $objs ; do
> +        rm -f "${D}${PTEST_PATH}/tests/${obj}"
> +    done
> +
> +    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
> +        touch -r "${B}/Makefile" {} +
> +
> +    # Substitute links to installed binaries.
> +    for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
> +        exedir=3D"${D}${PTEST_PATH}/src/bin/${prog}"
> +        install -d "$exedir"
> +        case "$prog" in
> +            lttng-consumerd)
> +                ln -s "${libdir}/lttng/libexec/$prog" "$exedir"
> +                ;;
> +            *)
> +                ln -s "${bindir}/$prog" "$exedir"
> +                ;;
> +        esac
> +    done
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c070356006cdc0545e42b7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>This upgrade is failing on the auto=
builders:</div><div><br></div>DEBUG: Executing shell function do_install_pt=
est_base<br>install: failed to access =E2=80=98TOPDIR/tmp/work/mips64-poky-=
linux/lttng-tools/2.9.3-r0/image/usr/lib/lttng-tools/ptest/tests/destructiv=
e=E2=80=99: No such file or directory<div><br></div><div>Ross</div><div><br=
></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1=
0 January 2017 at 23:06, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"mail=
to:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Notable recipe changes:<=
br>
<br>
* switch to using release tarball<br>
* brokensep no longer required<br>
* drop upstreamed error.h patch<br>
* change do_install_ptest to selectively copy build artifacts to<br>
=C2=A0 install tree.<br>
* use backported patch to address file-rdeps warning<br>
<br>
Signed-off-by: Nathan Lynch &lt;<a href=3D"mailto:nathan_lynch@mentor.com">=
nathan_lynch@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-error.h-common-<wbr>error.h.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 33 -----<br>
=C2=A0meta/recipes-kernel/lttng/<wbr>lttng-tools/run-ptest=C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0.../utils-remove-bogus-<wbr>interpreter.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 35 +++++<br>
=C2=A0.../{<a href=3D"http://lttng-tools_git.bb" rel=3D"noreferrer" target=
=3D"_blank">lttng-tools_git.bb</a> =3D&gt; <a href=3D"http://lttng-tools_2.=
9.3.bb" rel=3D"noreferrer" target=3D"_blank">lttng-tools_2.9.3.bb</a>}=C2=
=A0 =C2=A0| 142 +++++++++++----------<br>
=C2=A04 files changed, 112 insertions(+), 103 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/lttng/<wbr>lttng-tools/0001-Fi=
x-error.h-<wbr>common-error.h.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/<wbr>lttng-tools/utils-r=
emove-<wbr>bogus-interpreter.patch<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-tools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">ltt<wbr>ng-tools_git.bb</a> =3D&gt;=
 <a href=3D"http://lttng-tools_2.9.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">lttng-tools_2.9.3.bb</a>} (39%)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/<wbr>lttng-tools/0001-Fix-error.h-<w=
br>common-error.h.patch b/meta/recipes-kernel/lttng/<wbr>lttng-tools/0001-F=
ix-error.h-<wbr>common-error.h.patch<br>
deleted file mode 100644<br>
index 6c8a9b211a08..000000000000<br>
--- a/meta/recipes-kernel/lttng/<wbr>lttng-tools/0001-Fix-error.h-<wbr>comm=
on-error.h.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 6712db617fe9155ea236f6840c2bd1<wbr>8dbec4c871 Mon Sep 17 00:00:00 200=
1<br>
-From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com">mjeanso=
n@efficios.com</a>&gt;<br>
-Date: Wed, 15 Jun 2016 17:18:03 -0400<br>
-Subject: [PATCH] Fix: error.h -&gt; common/error.h<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com=
">mjeanson@efficios.com</a>&gt;<br>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau &lt;<a href=3D"mailto:jeremie.g=
alarneau@efficios.com">jeremie.galarneau@efficios.<wbr>com</a>&gt;<br>
-Signed-off-by: Peter Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlasc=
opco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
----<br>
- src/bin/lttng-sessiond/agent.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/bin/lttng-sessiond/<wbr>agent.c b/src/bin/lttng-sessiond/=
<wbr>agent.c<br>
-index 7cbbbde..310a7e8 100644<br>
---- a/src/bin/lttng-sessiond/<wbr>agent.c<br>
-+++ b/src/bin/lttng-sessiond/<wbr>agent.c<br>
-@@ -29,7 +29,7 @@<br>
- #include &quot;agent.h&quot;<br>
- #include &quot;ust-app.h&quot;<br>
- #include &quot;utils.h&quot;<br>
--#include &quot;error.h&quot;<br>
-+#include &quot;common/error.h&quot;<br>
-<br>
- #define AGENT_RET_CODE_INDEX(code) (code - AGENT_RET_CODE_SUCCESS)<br>
-<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/lttng/<wbr>lttng-tools/run-ptest b/meta/re=
cipes-kernel/lttng/<wbr>lttng-tools/run-ptest<br>
index 6230063442d6..705030ee53b8 100755<br>
--- a/meta/recipes-kernel/lttng/<wbr>lttng-tools/run-ptest<br>
+++ b/meta/recipes-kernel/lttng/<wbr>lttng-tools/run-ptest<br>
@@ -1,5 +1,6 @@<br>
=C2=A0#!/bin/sh<br>
=C2=A0# Without --ignore-exit, the tap harness causes any FAILs within a<br=
>
=C2=A0# test plan to raise ERRORs; this is just noise.<br>
-makeargs=3D&quot;LOG_DRIVER_FLAGS=3D--<wbr>ignore-exit&quot;<br>
-make -t all &gt;/dev/null 2&gt;&amp;1 &amp;&amp; exec make -s $makeargs ch=
eck 2&gt;/dev/null<br>
+makeargs=3D&quot;LOG_DRIVER_FLAGS=3D--<wbr>ignore-exit top_srcdir=3D$PWD t=
op_builddir=3D$PWD&quot;<br>
+make -k -t all &gt;/dev/null 2&gt;&amp;1<br>
+exec make -s $makeargs check 2&gt;/dev/null<br>
diff --git a/meta/recipes-kernel/lttng/<wbr>lttng-tools/utils-remove-<wbr>b=
ogus-interpreter.patch b/meta/recipes-kernel/lttng/<wbr>lttng-tools/utils-r=
emove-<wbr>bogus-interpreter.patch<br>
new file mode 100644<br>
index 000000000000..f08198208d4f<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/<wbr>lttng-tools/utils-remove-<wbr>bogus-in=
terpreter.patch<br>
@@ -0,0 +1,35 @@<br>
+From 4545eae3bccb0f5a97509d1405a280<wbr>00029a8d7d Mon Sep 17 00:00:00 200=
1<br>
+From: Nathan Lynch &lt;<a href=3D"mailto:nathan_lynch@mentor.com">nathan_l=
ynch@mentor.com</a>&gt;<br>
+Date: Mon, 9 Jan 2017 16:14:28 -0600<br>
+Subject: [PATCH] lttng-tools: remove bogus interpreter line from utils she=
ll<br>
+ library<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+tests/utils/utils.sh is always sourced, never executed, and<br>
+/src/bin/bash is not a typical path for a shell interpreter.=C2=A0 Just<br=
>
+delete it.<br>
+<br>
+Signed-off-by: Nathan Lynch &lt;<a href=3D"mailto:nathan_lynch@mentor.com"=
>nathan_lynch@mentor.com</a>&gt;<br>
+Signed-off-by: J=C3=A9r=C3=A9mie Galarneau &lt;<a href=3D"mailto:jeremie.g=
alarneau@efficios.com">jeremie.galarneau@efficios.<wbr>com</a>&gt;<br>
+---<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+ tests/utils/utils.sh | 2 --<br>
+ 1 file changed, 2 deletions(-)<br>
+<br>
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh<br>
+index 05d88650e9f3..9db0640b70f3 100644<br>
+--- a/tests/utils/utils.sh<br>
++++ b/tests/utils/utils.sh<br>
+@@ -1,5 +1,3 @@<br>
+-#!/src/bin/bash<br>
+-#<br>
+ # Copyright (C) - 2012 David Goulet &lt;<a href=3D"mailto:dgoulet@efficio=
s.com">dgoulet@efficios.com</a>&gt;<br>
+ #<br>
+ # This library is free software; you can redistribute it and/or modify it=
 under<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_git.bb=
" rel=3D"noreferrer" target=3D"_blank">lt<wbr>tng-tools_git.bb</a> b/meta/r=
ecipes-kernel/lttng/<a href=3D"http://lttng-tools_2.9.3.bb" rel=3D"noreferr=
er" target=3D"_blank">lt<wbr>tng-tools_2.9.3.bb</a><br>
similarity index 39%<br>
rename from meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">lttn<wbr>g-tools_git.bb</a><br>
rename to meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2.9.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">lttn<wbr>g-tools_2.9.3.bb</a><br>
index 29fd75b21705..0506feb0136c 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">lt<wbr>tng-tools_git.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2.9.3.bb" rel=
=3D"noreferrer" target=3D"_blank">lt<wbr>tng-tools_2.9.3.bb</a><br>
@@ -15,9 +15,6 @@ RDEPENDS_${PN}-ptest +=3D &quot;make perl bash gawk ${PN}=
 babeltrace procps&quot;<br>
=C2=A0# <a href=3D"http://babelstats.pl" rel=3D"noreferrer" target=3D"_blan=
k">babelstats.pl</a> wants getopt-long<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;perl-module-getopt-long&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>d11e0dba0df9024b8613c51e167a37<wbr>9b91e8b20b&quot;<=
br>
-PV =3D &quot;2.8.1+git${SRCPV}&quot;<br>
-<br>
=C2=A0PYTHON_OPTION =3D &quot;am_cv_python_pyexecdir=3D&#39;${<wbr>PYTHON_S=
ITEPACKAGES_DIR}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 am_cv_python=
_pythondir=3D&#39;${<wbr>PYTHON_SITEPACKAGES_DIR}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON_INCLU=
DE=3D&#39;-I${STAGING_<wbr>INCDIR}/python${PYTHON_<wbr>BASEVERSION}${PYTHON=
_ABI}&#39; \<br>
@@ -29,14 +26,15 @@ PACKAGECONFIG[kmod] =3D &quot;--enable-kmod, --disable-=
kmod, kmod&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;--enable-man-pages, --disable-man-p=
ages, asciidoc-native xmlto-native libxslt-native&quot;<br>
=C2=A0PACKAGECONFIG_remove_libc-musl =3D &quot;lttng-ust&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-tools.git;br=
anch=3Dstable-2.8" rel=3D"noreferrer" target=3D"_blank">git.lttng.org/lttng=
-<wbr>tools.git;branch=3Dstable-2.8</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-error.h-<wbr>comm=
on-error.h.patch \<br>
+SRC_URI =3D &quot;<a href=3D"https://lttng.org/files/lttng-tools/lttng-too=
ls-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://lttng.org/fi=
les/<wbr>lttng-tools/lttng-tools-${PV}.<wbr>tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://x32.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://utils-remove-bogus-<wbr>in=
terpreter.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>19fdcc5e9c307ef66581a2743a08a5<wbr>41&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>a6e6baaaa977dcbc9bce6b675881ee<wbr>c6645=
99b86f0d905a7b0b508539407<wbr>b24e&quot;<br>
<br>
-inherit autotools-brokensep ptest pkgconfig useradd python3-dir manpages<b=
r>
+inherit autotools ptest pkgconfig useradd python3-dir manpages<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0GROUPADD_PARAM_${PN} =3D &quot;tracing&quot;<br>
@@ -53,68 +51,76 @@ INSANE_SKIP_${PN} =3D &quot;libexec dev-so&quot;<br>
=C2=A0INSANE_SKIP_${PN}-dbg =3D &quot;libexec&quot;<br>
<br>
=C2=A0do_configure_prepend () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Delete a shipped m4 file that overrides our p=
atched one<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/m4/libxml.m4<br>
+=C2=A0 =C2=A0 # Delete a shipped m4 file that overrides our patched one<br=
>
+=C2=A0 =C2=A0 rm -f ${S}/m4/libxml.m4<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a -T ${B} ${D}${PTEST_PATH}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Prevent attempts to update Makefiles during t=
est runs, and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# silence &quot;Making check in $SUBDIR&quot; m=
essages.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH} -name Makefile -type f -=
exec \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s!^M=
akefile:!_Makefile:!&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/echo &quot=
;Making $$target in $$subdir&quot;; \\/d&#39; {} +<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Prevent attempts to update version.h during t=
est runs.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/^\.PHONY: version\.h$/d&#39; ${=
D}${PTEST_PATH}/include/<wbr>Makefile<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Silence &quot;Making check in $SUBDIR&quot; m=
essages.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH} -name Makefile -type f -=
exec \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/ech=
o &quot;Making $$target in $$subdir&quot;; \\/d&#39; {} +<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Substitute links to installed binaries.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for prog in lttng lttng-relayd lttng-sessiond l=
ttng-consumerd ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig=3D&quot;${D}${=
PTEST_PATH}/src/<wbr>bin/${prog}/${prog}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm &quot;$orig&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$prog&qu=
ot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lttng-consumerd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s &quot;${libdir}/lttng/libexec/$=
<wbr>prog&quot; &quot;$orig&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s &quot;${bindir}/$prog&quot; &qu=
ot;$orig&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove libtool artifacts.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH} \( -name &#39;*.l[ao]&#3=
9; -o -name &#39;*.lai&#39; \) -delete<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove object files and archives.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH} -name &#39;*.[oa]&#39; -=
type f -delete<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove Makefile.am and Makefile.in.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH} -name &#39;Makefile.*&#3=
9; -type f -delete<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove autom4te.cache.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${PTEST_PATH}/autom4te.<wbr>cache<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Replace libtool wrapper scripts (which won&#3=
9;t work on the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# target) with their corresponding binaries.<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for prog in unit/ini_config/ini_config \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regression/tools/li=
ve/live_<wbr>test \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regression/tools/he=
alth/<wbr>health_check ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basename=3D${prog##=
*/}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldir=3D${D}${PTEST_=
PATH}/tests/$<wbr>{prog%/*}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${ldir}/.libs=
/${basename} ${ldir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"http://checkpatch.pl" rel=3D"noref=
errer" target=3D"_blank">checkpatch.pl</a> is unneeded on target and causes=
 file-rdeps QA<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# warnings.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${PTEST_PATH}/extras/<a href=3D"http:=
//checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">check<wbr>patch.pl</a=
><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove built libraries as they confuse the p=
ackages&#39; runtime dependency resolution<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/src/lib/<wbr>lttng-ct=
l/.libs/<br>
+=C2=A0 =C2=A0 for f in Makefile tests/Makefile tests/utils/utils.sh ; do<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D &quot;${B}/$f&quot; &quot;${D}${PTE=
ST_PATH}/$f&quot;<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 for f in config/tap-driver.sh config/test-driver ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D &quot;${S}/$f&quot; &quot;${D}${PTE=
ST_PATH}/$f&quot;<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 # Prevent &#39;make check&#39; from recursing into non-test =
subdirectories.<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s!^SUBDIRS =3D .*!SUBDIRS =3D tests!&#39; &qu=
ot;${D}${PTEST_PATH}/Makefile&quot;<br>
+<br>
+=C2=A0 =C2=A0 # We don&#39;t need these<br>
+=C2=A0 =C2=A0 sed -i -e &#39;/dist_noinst_SCRIPTS =3D /,/^$/d&#39; &quot;$=
{D}${PTEST_PATH}/tests/<wbr>Makefile&quot;<br>
+<br>
+=C2=A0 =C2=A0 # We shouldn&#39;t need to build anything in tests/utils<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s!am__append_1 =3D . utils!am__append_1 =3D .=
 !&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${D}${PTEST_PATH}/tests/<wbr>Makefile&qu=
ot;<br>
+<br>
+=C2=A0 =C2=A0 # Copy the tests directory tree and the executables and<br>
+=C2=A0 =C2=A0 # Makefiles found within.<br>
+=C2=A0 =C2=A0 for d in $(find &quot;${B}/tests&quot; -type d -not -name .l=
ibs -printf &#39;%P &#39;) ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find &quot;${B}/tests/$d&quot; -maxdepth 1 -ex=
ecutable -type f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -D -t &quot;${D}${=
PTEST_PATH}/tests/$d&quot; {} +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -r &quot;${B}/tests/$d/Makefile&quot; &am=
p;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -t &quot;${D}${PTEST_=
PATH}/tests/$d&quot; &quot;${B}/tests/$d/Makefile&quot;<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 # We shouldn&#39;t need to build anything in tests/regressio=
n/tools<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s!^SUBDIRS =3D tools !SUBDIRS =3D !&#39; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${D}${PTEST_PATH}/tests/<wbr>regression/=
Makefile&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Prevent attempts to update Makefiles during test runs, and=
<br>
+=C2=A0 =C2=A0 # silence &quot;Making check in $SUBDIR&quot; messages.<br>
+=C2=A0 =C2=A0 find &quot;${D}${PTEST_PATH}&quot; -name Makefile -type f -e=
xec \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/Makefile:/,/^$/d&#39; -e &#39;=
/%: %.in/,/^$/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/echo &quot;Making $$target in $$subdi=
r&quot;; \\/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D \(.*\)/srcdir =3D ./&#39=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^builddir =3D \(.*\)/builddir =3D ./=
&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^all-am:.*/all-am:/&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {} +<br>
+<br>
+=C2=A0 =C2=A0 # These objects trigger [rpaths] QA checks; the test harness=
<br>
+=C2=A0 =C2=A0 # skips the associated tests if they&#39;re missing, so dele=
te<br>
+=C2=A0 =C2=A0 # them.<br>
+=C2=A0 =C2=A0 objs=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 objs=3D&quot;$objs regression/ust/ust-dl/libbar.<wbr>so&quot=
;<br>
+=C2=A0 =C2=A0 objs=3D&quot;$objs regression/ust/ust-dl/libfoo.<wbr>so&quot=
;<br>
+=C2=A0 =C2=A0 for obj in $objs ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${PTEST_PATH}/tests/${<wbr>obj=
}&quot;<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 find &quot;${D}${PTEST_PATH}&quot; -name Makefile -type f -e=
xec \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch -r &quot;${B}/Makefile&quot; {} +<br>
+<br>
+=C2=A0 =C2=A0 # Substitute links to installed binaries.<br>
+=C2=A0 =C2=A0 for prog in lttng lttng-relayd lttng-sessiond lttng-consumer=
d ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exedir=3D&quot;${D}${PTEST_PATH}/src/<wbr>bin/=
${prog}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;$exedir&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$prog&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng-consumerd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;${libd=
ir}/lttng/libexec/$<wbr>prog&quot; &quot;$exedir&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;${bind=
ir}/$prog&quot; &quot;$exedir&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c070356006cdc0545e42b7c--
