Return-Path: <wallinux@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4143F60AF9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 11:48:33 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id m25so8751038ioo.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zm2bMPQNdmvASzVGUe3vMLAWrn/Sn1UC+NFUKPbTl6U=;
	b=ZJfTUnWUAHBnjpySCQL5vn2TC/Wq/R3gO59hyCmOveG5Sri0QgjW3En1nQKz3n/yBx
	NOazXbSCsLKGELhJNZZDpefdRyJdv0Bw4OkTdBnEUsseDkojZ8pEm7arZt9dX+INcAW2
	Pa0wMC90SVJxmVbAwXG3Wk4iIhNr5AQPCXrFLG3isE+M11J3x/4mAoZPjdNZFyko3RsW
	8KgAEeVF5SX4MaQZ+PSztuHiQ8X1c6oEM/KCYOcZyx9CEDE0BOW7CHOvvp1w+ubhOMSf
	wyRrVKMwIB6l9g+coYBF8YZKL27XxfYactatU9Wt09C9De4LiTXEaManHWaIlVMe/Qxd
	Te8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zm2bMPQNdmvASzVGUe3vMLAWrn/Sn1UC+NFUKPbTl6U=;
	b=KyC9t6W6dJY5CuaMxIx3kfebjkjfpBRitabWKrnu79vL610zOubYp2pBalPSA2Y+4Z
	Y0viiLrAichWs+2DMseTC7oUIVN+UCCGFx3erb8JhfEWZKE0TDMnOvCF4azyb1JMd5Fz
	rSBdjjCDivlH1s0eSvEAww9YD/+9Cdp8KOT7VITjS5w/gyvqc5ZLyn0ETMNLFsuPeqxZ
	I6jCzvV87tRh+bIidWNBp7TyR9OOHl1rGTlbJGE9BjbmtCatMlsf8M55/Tm+t+aCcA/7
	yPM+CERP/EH5NItXLFJnLsbMAxay4QmuGosRWRo7Z+qDRYoh9zqUMXwobZKfG1MbR/jw
	l4Fg==
X-Gm-Message-State: ANhLgQ1NrjRtkFDkRXK76mS+adarSQnVkpusoymCjUiT+1Yc0m7Ms05O
	925pa8xsMsK+2SCuxm2hXjs3nc8T48pF7kF/U5Q=
X-Google-Smtp-Source: ADFU+vsxqBP7kwkdNLvf/nggFPFqc2Dq6f18dzBIHk4mg6Qt7fM2DKvlFdOX/2Chu4l3g4T8bZfeJF7p9p0gBGt+ubs=
X-Received: by 2002:a5e:9e45:: with SMTP id j5mr13271413ioq.179.1583754514855; 
	Mon, 09 Mar 2020 04:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200305120629.329-1-wallinux@gmail.com>
	<CAMKF1sqjUDE2Lxe5saLRc-o8Qpe=suQavaAC1Vr7V9-PtK7qRQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqjUDE2Lxe5saLRc-o8Qpe=suQavaAC1Vr7V9-PtK7qRQ@mail.gmail.com>
From: Anders Wallin <wallinux@gmail.com>
Date: Mon, 9 Mar 2020 12:48:21 +0100
Message-ID: <CAF2baFeRYHVps5YnMVWbKV=nrzDedzSOke-U-Se7piaoApvoTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 09 Mar 2020 11:48:34 -0000
Content-Type: multipart/alternative; boundary="00000000000044fb3b05a06a95a2"

--00000000000044fb3b05a06a95a2
Content-Type: text/plain; charset="UTF-8"

I will check/fix it
Anders Wallin


On Sat, Mar 7, 2020 at 3:17 PM Khem Raj <raj.khem@gmail.com> wrote:

> I am seeing a QA textrel issue with clang/arm
>
> http://errors.yoctoproject.org/Errors/Details/393983/
>
> On Thu, Mar 5, 2020 at 4:07 AM Anders Wallin <wallinux@gmail.com> wrote:
> >
> > Babeltrace 1 vs. Babeltrace 2
> >
> > The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was
> released.
> > Babeltrace 2 is a complete rewrite of the library, Python bindings, and
> CLI. It
> > is plugin based and offers much more features and potential than
> Babeltrace 1.
> >
> > Because Babeltrace 2 is still a young released project, some
> distributions still
> > provide packages for the Babeltrace 1 project. Both projects can coexist
> on the
> > same system as there are no common installed files.
> >
> > Signed-off-by: Anders Wallin <wallinux@gmail.com>
> > ---
> >  meta/conf/distro/include/distro_alias.inc     |  1 +
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../packagegroup-core-tools-profile.bb        |  2 +
> >  ...not-run-test-applications-from-.libs.patch | 28 ++++++
> >  .../lttng/babeltrace2/run-ptest               |  9 ++
> >  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 92 +++++++++++++++++++
> >  7 files changed, 134 insertions(+)
> >  create mode 100644
> meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> >  create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest
> >  create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> >
> > diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> > index 79ebcaee29..0e4a9a9f8f 100644
> > --- a/meta/conf/distro/include/distro_alias.inc
> > +++ b/meta/conf/distro/include/distro_alias.inc
> > @@ -15,6 +15,7 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
> >  DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
> >  DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover
> Debian=avahi-discover"
> >  DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
> > +DISTRO_PN_ALIAS_pn-babeltrace2 = "OSPDT"
> >  DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
> >  DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
> >  DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 10095ffe76..adb18228e7 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -59,6 +59,7 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <
> liezhi.yang@windriver.com>"
> >  RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > +RECIPE_MAINTAINER_pn-babeltrace2 = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER_pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com
> >"
> >  RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> > index 4afac58e3a..d6f3aafc7f 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -64,6 +64,7 @@ PTESTS_FAST = "\
> >
> >  PTESTS_SLOW = "\
> >      babeltrace-ptest \
> > +    babeltrace2-ptest \
> >      busybox-ptest \
> >      dbus-test-ptest \
> >      e2fsprogs-ptest \
> > diff --git a/meta/recipes-core/packagegroups/
> packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/
> packagegroup-core-tools-profile.bb
> > index 984c2fac92..ac180b542a 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > @@ -46,6 +46,7 @@ LTTNGMODULES = "lttng-modules"
> >  LTTNGMODULES_arc = ""
> >
> >  BABELTRACE = "babeltrace"
> > +BABELTRACE2 = "babeltrace2"
> >
> >  # valgrind does not work on the following configurations/architectures
> >
> > @@ -69,6 +70,7 @@ RDEPENDS_${PN} = "\
> >      ${LTTNGTOOLS} \
> >      ${LTTNGMODULES} \
> >      ${BABELTRACE} \
> > +    ${BABELTRACE2} \
> >      ${SYSTEMTAP} \
> >      ${VALGRIND} \
> >      "
> > diff --git
> a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> > new file mode 100644
> > index 0000000000..805dde8064
> > --- /dev/null
> > +++
> b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> > @@ -0,0 +1,28 @@
> > +From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
> > +Message-Id: <
> 582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com
> >
> > +From: Anders Wallin <wallinux@gmail.com>
> > +Date: Thu, 5 Mar 2020 11:20:04 +0100
> > +Subject: [PATCH] tests: do not run test applications from .libs
> > +
> > +Cross compile specific change
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Anders Wallin <wallinux@gmail.com>
> > +---
> > + tests/lib/test_plugin | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
> > +index 652c90cc..1f817c50 100755
> > +--- a/tests/lib/test_plugin
> > ++++ b/tests/lib/test_plugin
> > +@@ -26,4 +26,4 @@ fi
> > + # shellcheck source=../utils/utils.sh
> > + source "$UTILSSH"
> > +
> > +-"${BT_TESTS_BUILDDIR}/lib/plugin"
> "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
> > ++"${BT_TESTS_BUILDDIR}/lib/plugin"
> "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> > new file mode 100755
> > index 0000000000..72fe223436
> > --- /dev/null
> > +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> > @@ -0,0 +1,9 @@
> > +#!/bin/sh
> > +# use target=recheck if you want to recheck failing tests
> > +[ "$target" = "" ] && target=check
> > +
> > +# Without --ignore-exit, the tap harness causes any FAILs within a
> > +# test plan to raise ERRORs; this is just noise.
> > +makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD
> abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
> > +
> > +exec make -C tests -k -s $makeargs $target 2>/dev/null
> > diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> > new file mode 100644
> > index 0000000000..16953d6807
> > --- /dev/null
> > +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> > @@ -0,0 +1,92 @@
> > +SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
> > +DESCRIPTION = "Babeltrace provides trace read and write libraries in
> host side, as well as a trace converter, which used to convert LTTng 2.0
> traces into human-readable log."
> > +HOMEPAGE = "http://babeltrace.org/"
> > +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> > +LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
> > +
> > +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> > +
> > +SRC_URI = "git://
> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
> > +          file://run-ptest \
> > +
> file://0001-tests-do-not-run-test-applications-from-.libs.patch \
> > +         "
> > +SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
> > +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig ptest
> > +
> > +EXTRA_OECONF = "--disable-debug-info"
> > +
> > +PACKAGECONFIG ??= "manpages"
> > +PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native
> xmlto-native"
> > +
> > +FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
> > +FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
> > +
> > +ASNEEDED = ""
> > +
> > +RDEPENDS_${PN}-ptest += "bash gawk python3"
> > +
> > +do_compile_ptest () {
> > +    make -C tests all
> > +}
> > +
> > +do_install_ptest () {
> > +    install -d "${D}${PTEST_PATH}/tests"
> > +
> > +    # Copy required files from source directory
> > +    for d in $(find "${S}/tests" -type d -printf '%P ') ; do
> > +       install -d "${D}${PTEST_PATH}/tests/$d"
> > +       find "${S}/tests/$d" -maxdepth 1 -executable -type f \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
> > +       find "${S}/tests/$d" -maxdepth 1 -name *.sh \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> > +       find "${S}/tests/$d" -maxdepth 1 -name *.py \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> > +       find "${S}/tests/$d" -maxdepth 1 -name *.expect \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> > +    done
> > +    install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
> > +    cp -a ${S}/tests/data/ctf-traces/*
> ${D}${PTEST_PATH}/tests/data/ctf-traces/
> > +
> > +    # Copy the tests directory tree and the executables and
> > +    # Makefiles found within.
> > +    install -D "${B}/tests/Makefile" "${D}${PTEST_PATH}/tests/"
> > +    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P
> ') ; do
> > +       install -d "${D}${PTEST_PATH}/tests/$d"
> > +       find "${B}/tests/$d" -maxdepth 1 -executable -type f \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
> > +       test -r "${B}/tests/$d/Makefile" && \
> > +           install -t "${D}${PTEST_PATH}/tests/$d"
> "${B}/tests/$d/Makefile"
> > +       find "${B}/tests/$d" -maxdepth 1 -name *.sh \
> > +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> > +    done
> > +
> > +    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
> > +       for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f
> -printf '%P ') ; do
> > +           cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
> > +       done
> > +    done
> > +
> > +    # Prevent attempts to update Makefiles during test runs, and
> > +    # silence "Making check in $SUBDIR" messages.
> > +    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
> > +        sed -i \
> > +        -e '/Makefile:/,/^$/d' \
> > +        -e '/%: %.in/,/^$/d' \
> > +        -e '/echo "Making $$target in $$subdir"; \\/d' \
> > +        -e 's/^srcdir = \(.*\)/srcdir = ./' \
> > +        -e 's/^builddir = \(.*\)/builddir = ./' \
> > +        -e 's/^all-am:.*/all-am:/' \
> > +        {} +
> > +
> > +    # Substitute links to installed binaries.
> > +    install -d "${D}${PTEST_PATH}/src/cli/"
> > +    ln -s "${bindir}/babeltrace2" ${D}${PTEST_PATH}/src/cli/
> > +
> > +    # Remove architechture specific testfiles
> > +    rm -rf
> ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
> > +}
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000044fb3b05a06a95a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I will check/fix it<br clear=3D"all"><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Anders Wallin=
</div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 7, 2020 at 3:17 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">I am seeing a QA textrel issue wit=
h clang/arm<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/393983/" rel=3D"no=
referrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/3=
93983/</a><br>
<br>
On Thu, Mar 5, 2020 at 4:07 AM Anders Wallin &lt;<a href=3D"mailto:wallinux=
@gmail.com" target=3D"_blank">wallinux@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Babeltrace 1 vs. Babeltrace 2<br>
&gt;<br>
&gt; The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was re=
leased.<br>
&gt; Babeltrace 2 is a complete rewrite of the library, Python bindings, an=
d CLI. It<br>
&gt; is plugin based and offers much more features and potential than Babel=
trace 1.<br>
&gt;<br>
&gt; Because Babeltrace 2 is still a young released project, some distribut=
ions still<br>
&gt; provide packages for the Babeltrace 1 project. Both projects can coexi=
st on the<br>
&gt; same system as there are no common installed files.<br>
&gt;<br>
&gt; Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com"=
 target=3D"_blank">wallinux@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/distro_alias.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 .../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 .../<a href=3D"http://packagegroup-core-tools-profile.bb" rel=3D=
"noreferrer" target=3D"_blank">packagegroup-core-tools-profile.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 ...not-run-test-applications-from-.libs.patch | 28 ++++++<br>
&gt;=C2=A0 .../lttng/babeltrace2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++<br>
&gt;=C2=A0 .../recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> | 92 +++++++=
++++++++++++<br>
&gt;=C2=A0 7 files changed, 134 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-te=
sts-do-not-run-test-applications-from-.libs.patch<br>
&gt;=C2=A0 create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-pte=
st<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/lttng/<a href=3D"http://b=
abeltrace2_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1=
.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/dis=
tro/include/distro_alias.inc<br>
&gt; index 79ebcaee29..0e4a9a9f8f 100644<br>
&gt; --- a/meta/conf/distro/include/distro_alias.inc<br>
&gt; +++ b/meta/conf/distro/include/distro_alias.inc<br>
&gt; @@ -15,6 +15,7 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts =3D &quot;OE-C=
ore&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-atk =3D &quot;Fedora=3Datk OpenSuSE=3Datk&quo=
t;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-avahi-ui =3D &quot;Ubuntu=3Davahi-discover De=
bian=3Davahi-discover&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-babeltrace =3D &quot;OSPDT&quot;<br>
&gt; +DISTRO_PN_ALIAS_pn-babeltrace2 =3D &quot;OSPDT&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-bjam =3D &quot;OpenSuSE=3Dboost-jam Debian=3D=
bjam&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-blktool =3D &quot;Debian=3Dblktool Mandriva=
=3Dblktool&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-bluez5 =3D &quot;Fedora=3Dbluez=C2=A0 Opensus=
e=3Dbluez&quot;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 10095ffe76..adb18228e7 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -59,6 +59,7 @@ RECIPE_MAINTAINER_pn-automake =3D &quot;Robert Yang =
&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.y=
ang@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-avahi =3D &quot;Yi Zhao &lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&q=
uot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-avahi-ui =3D &quot;Yi Zhao &lt;<a href=3D"m=
ailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt=
;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-babeltrace =3D &quot;Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gm=
ail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-babeltrace2 =3D &quot;Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-base-files =3D &quot;Anuj Mittal &lt;<a hre=
f=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com<=
/a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-base-passwd =3D &quot;Anuj Mittal &lt;<a hr=
ef=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com=
</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-bash =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;&quot;<br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index 4afac58e3a..d6f3aafc7f 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -64,6 +64,7 @@ PTESTS_FAST =3D &quot;\<br>
&gt;<br>
&gt;=C2=A0 PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 babeltrace-ptest \<br>
&gt; +=C2=A0 =C2=A0 babeltrace2-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 busybox-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dbus-test-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 e2fsprogs-ptest \<br>
&gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://package=
group-core-tools-profile.bb" rel=3D"noreferrer" target=3D"_blank">packagegr=
oup-core-tools-profile.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"=
http://packagegroup-core-tools-profile.bb" rel=3D"noreferrer" target=3D"_bl=
ank">packagegroup-core-tools-profile.bb</a><br>
&gt; index 984c2fac92..ac180b542a 100644<br>
&gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-c=
ore-tools-profile.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-cor=
e-tools-profile.bb</a><br>
&gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-c=
ore-tools-profile.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-cor=
e-tools-profile.bb</a><br>
&gt; @@ -46,6 +46,7 @@ LTTNGMODULES =3D &quot;lttng-modules&quot;<br>
&gt;=C2=A0 LTTNGMODULES_arc =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 BABELTRACE =3D &quot;babeltrace&quot;<br>
&gt; +BABELTRACE2 =3D &quot;babeltrace2&quot;<br>
&gt;<br>
&gt;=C2=A0 # valgrind does not work on the following configurations/archite=
ctures<br>
&gt;<br>
&gt; @@ -69,6 +70,7 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${LTTNGTOOLS} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${LTTNGMODULES} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${BABELTRACE} \<br>
&gt; +=C2=A0 =C2=A0 ${BABELTRACE2} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${SYSTEMTAP} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${VALGRIND} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-r=
un-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrac=
e2/0001-tests-do-not-run-test-applications-from-.libs.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..805dde8064<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test=
-applications-from-.libs.patch<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +Message-Id: &lt;<a href=3D"mailto:582713cc9a013481eeef253195d644020f6=
37ec4.1583403622.git.wallinux@gmail.com" target=3D"_blank">582713cc9a013481=
eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com</a>&gt;<br>
&gt; +From: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com" target=
=3D"_blank">wallinux@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 5 Mar 2020 11:20:04 +0100<br>
&gt; +Subject: [PATCH] tests: do not run test applications from .libs<br>
&gt; +<br>
&gt; +Cross compile specific change<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com=
" target=3D"_blank">wallinux@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + tests/lib/test_plugin | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin<br>
&gt; +index 652c90cc..1f817c50 100755<br>
&gt; +--- a/tests/lib/test_plugin<br>
&gt; ++++ b/tests/lib/test_plugin<br>
&gt; +@@ -26,4 +26,4 @@ fi<br>
&gt; + # shellcheck source=3D../utils/utils.sh<br>
&gt; + source &quot;$UTILSSH&quot;<br>
&gt; +<br>
&gt; +-&quot;${BT_TESTS_BUILDDIR}/lib/plugin&quot; &quot;${BT_TESTS_BUILDDI=
R}/lib/test-plugin-plugins/.libs&quot;<br>
&gt; ++&quot;${BT_TESTS_BUILDDIR}/lib/plugin&quot; &quot;${BT_TESTS_BUILDDI=
R}/lib/test-plugin-plugins&quot;<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/re=
cipes-kernel/lttng/babeltrace2/run-ptest<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..72fe223436<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest<br>
&gt; @@ -0,0 +1,9 @@<br>
&gt; +#!/bin/sh<br>
&gt; +# use target=3Drecheck if you want to recheck failing tests<br>
&gt; +[ &quot;$target&quot; =3D &quot;&quot; ] &amp;&amp; target=3Dcheck<br=
>
&gt; +<br>
&gt; +# Without --ignore-exit, the tap harness causes any FAILs within a<br=
>
&gt; +# test plan to raise ERRORs; this is just noise.<br>
&gt; +makeargs=3D&quot;LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$P=
WD abs_top_builddir=3D$PWD GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3&quot;<br>
&gt; +<br>
&gt; +exec make -C tests -k -s $makeargs $target 2&gt;/dev/null<br>
&gt; diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> b/me=
ta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..16953d6807<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
&gt; @@ -0,0 +1,92 @@<br>
&gt; +SUMMARY =3D &quot;Babeltrace2 - Trace Format Babel Tower&quot;<br>
&gt; +DESCRIPTION =3D &quot;Babeltrace provides trace read and write librar=
ies in host side, as well as a trace converter, which used to convert LTTng=
 2.0 traces into human-readable log.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://babeltrace.org/" rel=3D"noreferr=
er" target=3D"_blank">http://babeltrace.org/</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://bugs.lttng.org/projects/babel=
trace" rel=3D"noreferrer" target=3D"_blank">https://bugs.lttng.org/projects=
/babeltrace</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT &amp; GPLv2 &amp; LGPLv2.1 &amp; BSD-2-Clause&q=
uot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6a458c13f18385b7bc50=
69a6d7b176e&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native flex-native&q=
uot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/dia=
mon/babeltrace.git;branch=3Dstable-2.0" rel=3D"noreferrer" target=3D"_blank=
">git.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-2.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-do-not-run-test-=
applications-from-.libs.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRCREV =3D &quot;06df58f89ee51b1a2c6a2c187ec3f15691633910&quot;<br>
&gt; +UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;2(\.\d+)+)$&quot=
;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig ptest<br>
&gt; +<br>
&gt; +EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot;manpages&quot;<br>
&gt; +PACKAGECONFIG[manpages] =3D &quot;, --disable-man-pages, asciidoc-nat=
ive xmlto-native&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-staticdev +=3D &quot;${libdir}/babeltrace2/plugins/*.a&qu=
ot;<br>
&gt; +FILES_${PN} +=3D &quot;${libdir}/babeltrace2/plugins/*.so&quot;<br>
&gt; +<br>
&gt; +ASNEEDED =3D &quot;&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN}-ptest +=3D &quot;bash gawk python3&quot;<br>
&gt; +<br>
&gt; +do_compile_ptest () {<br>
&gt; +=C2=A0 =C2=A0 make -C tests all<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/tests&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Copy required files from source directory<br>
&gt; +=C2=A0 =C2=A0 for d in $(find &quot;${S}/tests&quot; -type d -printf =
&#39;%P &#39;) ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${PTEST_PATH}/tests/$=
d&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1=
 -executable -type f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1=
 -name *.sh \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} \;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1=
 -name *.py \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} \;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1=
 -name *.expect \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} \;<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/tests/data/ctf-trace=
s/&quot;<br>
&gt; +=C2=A0 =C2=A0 cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/te=
sts/data/ctf-traces/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Copy the tests directory tree and the executables and=
<br>
&gt; +=C2=A0 =C2=A0 # Makefiles found within.<br>
&gt; +=C2=A0 =C2=A0 install -D &quot;${B}/tests/Makefile&quot; &quot;${D}${=
PTEST_PATH}/tests/&quot;<br>
&gt; +=C2=A0 =C2=A0 for d in $(find &quot;${B}/tests&quot; -type d -not -na=
me .libs -printf &#39;%P &#39;) ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${PTEST_PATH}/tests/$=
d&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${B}/tests/$d&quot; -maxdepth 1=
 -executable -type f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0test -r &quot;${B}/tests/$d/Makefile&quot;=
 &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -t &quot;${D}${PTEST=
_PATH}/tests/$d&quot; &quot;${B}/tests/$d/Makefile&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${B}/tests/$d&quot; -maxdepth 1=
 -name *.sh \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}=
${PTEST_PATH}/tests/$d&quot; {} \;<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for d in $(find &quot;${B}/tests&quot; -type d -name .l=
ibs -printf &#39;%P &#39;) ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in $(find &quot;${B}/tests/$d&quot; =
-maxdepth 1 -executable -type f -printf &#39;%P &#39;) ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/tests/$d/$f ${D}${PT=
EST_PATH}/tests/`dirname $d`/$f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Prevent attempts to update Makefiles during test runs=
, and<br>
&gt; +=C2=A0 =C2=A0 # silence &quot;Making check in $SUBDIR&quot; messages.=
<br>
&gt; +=C2=A0 =C2=A0 find &quot;${D}${PTEST_PATH}&quot; -name Makefile -type=
 f -exec \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/Makefile:/,/^$/d&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/%: %.in/,/^$/d&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/echo &quot;Making $$target in $$=
subdir&quot;; \\/d&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D \(.*\)/srcdir =3D .=
/&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^builddir =3D \(.*\)/builddir =
=3D ./&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^all-am:.*/all-am:/&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {} +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Substitute links to installed binaries.<br>
&gt; +=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/src/cli/&quot;<br>
&gt; +=C2=A0 =C2=A0 ln -s &quot;${bindir}/babeltrace2&quot; ${D}${PTEST_PAT=
H}/src/cli/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Remove architechture specific testfiles<br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-u=
tils.debug-info/*<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000044fb3b05a06a95a2--
