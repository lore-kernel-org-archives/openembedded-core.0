Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CDF6678960
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 17:03:36 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id y128so4244447iod.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=faHyibT/323uMIQndLzporHZ2xwGo2lwKWnxhtxpEmo=;
	b=gtC4/cNR6fT75FVgc9XXS0LjLvkxcvwrruT/0ZeTF48uHrUn8bMJdJJ778m527aZrQ
	TV9TWRLShbYzbMB05m3eYb/aVTj3cjgdkwxdjEoJ6jPseVFvC8navZIRXA5kF1gR+F8H
	DH53B36KDmPNIf4fouXA/JAYMwjp1Icea7jFCI6zqQMrm+JwlfPUqR80UIw898lQDEMv
	5wwtNHdohJohuA5PXlUWd86bzSJEK/U1mKnUj91UT1+c2IVkFanlljUkTeU7RzKEccpv
	r7yzwgfjTmy5+n/tkv8Wv2pCHNxhqQAB5Pa4Mv+VrSMijEavPrUqGVyk5RDI5w4igb+7
	VZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=faHyibT/323uMIQndLzporHZ2xwGo2lwKWnxhtxpEmo=;
	b=FNkgc19mdPp595jLprAojaGtncjRyBWC3DNGdVIHVFC5RDOZ5eghU1CREMvoJWqV4W
	kly4/aR6w1J3bN3xRIcn5/pLTvCKfvT9hfMCUcWb9thtpNlcf6D4xLcWs1IJoltnnxiq
	++EGIsGON5CJStpvW2MdE5w92UrijnKyC1ZLhEG2K/pwbrY7tLy+byvOOy21FeYKUEbj
	z3mUNuFENn+BIiJF+dxvPJdA/a405hlB9o3JIaI+9fbe+Q12o4KCewm+T8HEcT7r51i1
	Jk9a+7HNRfr2ATTNi1MipRAqCF4Aj2aT6zkpp9O02BjRK0rPShMZbZXknN1kc4W1+RrB
	XkYA==
X-Gm-Message-State: AElRT7G4PdUn28kxJWONC4QXvx6XC48IlvFeJn62viQDLSh0JAg/dTIw
	0N3VSiAdAUABdjIdOmvBmlAReSo+tmrMNa31fuYV8A==
X-Google-Smtp-Source: AG47ELsnV8zc1KAFhcn4OtEvX0uylKlchGqVWTt0x1zK7M4bNxHFN1AhvMA/5JVO/sx3pJaHlDpTbtYfomCnZFmpmhc=
X-Received: by 10.107.161.200 with SMTP id k191mr12037329ioe.270.1521479017729;
	Mon, 19 Mar 2018 10:03:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 10:03:17 -0700 (PDT)
In-Reply-To: <1521442149-27776-1-git-send-email-anuj.mittal@intel.com>
References: <1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
	<1521442149-27776-1-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 17:03:17 +0000
Message-ID: <CAJTo0Lb3aVFUXAbG+f4OWse5TpFYC=6Lpgjf8xeF2C8=34YKWw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gstreamer: enable ptest support
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
X-List-Received-Date: Mon, 19 Mar 2018 17:03:37 -0000
Content-Type: multipart/alternative; boundary="001a113e919862a2d20567c6f0ac"

--001a113e919862a2d20567c6f0ac
Content-Type: text/plain; charset="UTF-8"

You're missing a dependency on make in PN-ptest, but installing that
results in about 20% of the tests failing.  Should they all work?

Ross

On 19 March 2018 at 06:49, Anuj Mittal <anuj.mittal@intel.com> wrote:

> Make sure that the tests are packaged and can be executed
> when ptest is enabled. Also, remove build host specific references
> from Makefile.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../files/add-a-target-to-compile-tests.patch      | 46
> ++++++++++++++++++++++
>  meta/recipes-multimedia/gstreamer/files/run-ptest  |  3 ++
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 25 +++++++++++-
>  3 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/add-a-target-
> to-compile-tests.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
>
> diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> b/meta/recipes-multimedia/gstreamer/files/add-a-target-
> to-compile-tests.patch
> new file mode 100644
> index 0000000..c918bbe
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-
> to-compile-tests.patch
> @@ -0,0 +1,46 @@
> +From e69e5408f03a2f65045a418af6605653c06ec28b Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Tue, 27 Feb 2018 09:27:01 +0800
> +Subject: [PATCH] add targets for test installation
> +
> +Targets to make sure tests can be installed and then run on
> +the target.
> +
> +Upstream-Status: Inappropriate [specific to oe setup]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + tests/check/Makefile.am | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
> +index afc1591..fb5c1c9 100644
> +--- a/tests/check/Makefile.am
> ++++ b/tests/check/Makefile.am
> +@@ -175,6 +175,23 @@ noinst_PROGRAMS =
> +
> + TESTS = $(check_PROGRAMS)
> +
> ++install-ptest: $(TESTS)
> ++      @$(INSTALL) -d $(DESTDIR)
> ++      @for dir in `find -maxdepth 1 -type d`; do \
> ++              if [ -x $$dir/.libs ]; then \
> ++                      $(INSTALL) -d $(DESTDIR)/$$dir; \
> ++                      $(INSTALL_PROGRAM) $$dir/.libs/*
> $(DESTDIR)/$$dir/; \
> ++              fi \
> ++      done
> ++
> ++runtests:
> ++      @for b in $(TESTS); do \
> ++              if [ -x $$b ]; then \
> ++                      $(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver
> --test-name "$$b" \
> ++                      --log-file $$b.log --trs-file $$b.trs $$b; \
> ++              fi \
> ++      done
> ++
> + noinst_HEADERS = \
> +       gst/capslist.h \
> +       gst/struct_arm.h \
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest
> b/meta/recipes-multimedia/gstreamer/files/run-ptest
> new file mode 100644
> index 0000000..473d0b6
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -k runtests
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> index c2df1f3..91f5067 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> @@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
>
>  DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native
> flex-native"
>
> -inherit autotools pkgconfig gettext upstream-version-is-even
> gobject-introspection gtk-doc
> +inherit autotools pkgconfig gettext upstream-version-is-even
> gobject-introspection gtk-doc ptest
>
>  # This way common/m4/introspection.m4 will come first
>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead
> of our common introspection.m4 file)
> @@ -18,9 +18,12 @@ SRC_URI_append = " \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
>      file://gtk-doc-tweaks.patch \
>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> \
> +    file://add-a-target-to-compile-tests.patch \
> +    file://run-ptest \
>  "
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
> +                   "
>
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
> @@ -59,3 +62,21 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>  do_compile_prepend() {
>          export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.
> libs"
>  }
> +
> +do_compile_ptest() {
> +        oe_runmake build-checks
> +}
> +
> +do_install_ptest() {
> +        oe_runmake -C tests/check DESTDIR=${D}${PTEST_PATH} install-ptest
> +        install -m 644 ${B}/tests/check/Makefile ${D}${PTEST_PATH}
> +        install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
> +        sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +            -e 's|${DEBUG_PREFIX_MAP}||g' \
> +            -e 's:${HOSTTOOLS_DIR}/::g' \
> +            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e
> 's/^Makefile:/_Makefile:/' \
> +            -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir =
> \(.*\)/top_srcdir = ./' \
> +            -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir =
> \(.*\)/top_builddir = ./' \
> +            -i ${D}${PTEST_PATH}/Makefile
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113e919862a2d20567c6f0ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re missing a dependency on make in PN-ptest, but i=
nstalling that results in about 20% of the tests failing.=C2=A0 Should they=
 all work?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 19 March 2018 at 06:49, Anuj Mittal <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">a=
nuj.mittal@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">Make sure that the tests are packaged and can be execute=
d<br>
when ptest is enabled. Also, remove build host specific references<br>
from Makefile.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anu=
j.mittal@intel.com</a>&gt;<br>
---<br>
</span>=C2=A0.../files/add-a-target-to-<wbr>compile-tests.patch=C2=A0 =C2=
=A0 =C2=A0 | 46 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-multimedia/<wbr>gstreamer/files/run-ptest=C2=A0 |=C2=A0 =
3 ++<br>
=C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc | 25 ++++++++=
+++-<br>
=C2=A03 files changed, 72 insertions(+), 2 deletions(-)<br>
<span class=3D"">=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstr=
eamer/files/add-a-target-<wbr>to-compile-tests.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/files/run-p=
test<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/files/add-a-target-<wbr=
>to-compile-tests.patch b/meta/recipes-multimedia/<wbr>gstreamer/files/add-=
a-target-<wbr>to-compile-tests.patch<br>
new file mode 100644<br>
</span>index 0000000..c918bbe<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/files/add-a-target-<wbr>to-com=
pile-tests.patch<br>
@@ -0,0 +1,46 @@<br>
+From e69e5408f03a2f65045a418af66056<wbr>53c06ec28b Mon Sep 17 00:00:00 200=
1<br>
<span class=3D"">+From: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel=
.com">anuj.mittal@intel.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 09:27:01 +0800<br>
+Subject: [PATCH] add targets for test installation<br>
+<br>
+Targets to make sure tests can be installed and then run on<br>
+the target.<br>
+<br>
+Upstream-Status: Inappropriate [specific to oe setup]<br>
+<br>
+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">an=
uj.mittal@intel.com</a>&gt;<br>
+---<br>
</span>+ tests/check/Makefile.am | 17 +++++++++++++++++<br>
+ 1 file changed, 17 insertions(+)<br>
+<br>
+diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am<br>
+index afc1591..fb5c1c9 100644<br>
+--- a/tests/check/Makefile.am<br>
++++ b/tests/check/Makefile.am<br>
+@@ -175,6 +175,23 @@ noinst_PROGRAMS =3D<br>
<span class=3D"">+<br>
+ TESTS =3D $(check_PROGRAMS)<br>
+<br>
++install-ptest: $(TESTS)<br>
++=C2=A0 =C2=A0 =C2=A0 @$(INSTALL) -d $(DESTDIR)<br>
</span>++=C2=A0 =C2=A0 =C2=A0 @for dir in `find -maxdepth 1 -type d`; do \<=
br>
<div><div class=3D"h5">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f [ -x $$dir/.libs ]; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL) -d $(DESTDIR)/$$dir; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br>
++<br>
++runtests:<br>
++=C2=A0 =C2=A0 =C2=A0 @for b in $(TESTS); do \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $$b ]; then \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver --test-name &quot;$$b&quot=
; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --log-file $$b.log --trs-file $$b.trs $$b; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br>
++<br>
+ noinst_HEADERS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst/capslist.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst/struct_arm.h \<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/files/run-ptest b/meta/=
recipes-multimedia/<wbr>gstreamer/files/run-ptest<br>
new file mode 100644<br>
index 0000000..473d0b6<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/files/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+make -k runtests<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc b/meta=
/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
</div></div>index c2df1f3..91f5067 100644<br>
<span class=3D"">--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.=
inc<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
@@ -8,7 +8,7 @@ LICENSE =3D &quot;LGPLv2+&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native libcap libxml2 bison-nativ=
e flex-native&quot;<br>
<br>
-inherit autotools pkgconfig gettext upstream-version-is-even gobject-intro=
spection gtk-doc<br>
+inherit autotools pkgconfig gettext upstream-version-is-even gobject-intro=
spection gtk-doc ptest<br>
<br>
=C2=A0# This way common/m4/introspection.m4 will come first<br>
=C2=A0# (it has a custom INTROSPECTION_INIT macro, and so must be used inst=
ead of our common introspection.m4 file)<br>
@@ -18,9 +18,12 @@ SRC_URI_append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-path=
s-with-<wbr>PKG_CON.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://gtk-doc-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gst-<wbr>gstpluginloader.c-when-env-<wbr>va=
r-is-set-do-not-fal.patch \<br>
+=C2=A0 =C2=A0 file://add-a-target-to-<wbr>compile-tests.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
<br>
=C2=A0PACKAGECONFIG[debug] =3D &quot;--enable-debug,--disable-<wbr>debug&qu=
ot;<br>
=C2=A0PACKAGECONFIG[tests] =3D &quot;--enable-tests,--disable-<wbr>tests&qu=
ot;<br>
</span>@@ -59,3 +62,21 @@ do_configure[prefuncs] +=3D &quot;delete_pkg_m4_f=
ile&quot;<br>
<span class=3D"">=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/g=
st/<wbr>.libs:${B}/libs/gst/base/.<wbr>libs&quot;<br>
=C2=A0}<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake build-checks<br>
+}<br>
+<br>
+do_install_ptest() {<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C tests/check DESTDIR=3D${D=
}${PTEST_PATH} install-ptest<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 instal=
l -m 644 ${B}/tests/check/Makefile ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 ${S}/test-driver ${D}${PTEST_PA=
TH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s,--sysroot=3D${STAGING_DIR_<wbr>T=
ARGET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|${DEBUG_PREFIX_MAP}||g=
&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${HOSTTOOLS_DIR}/::g&#=
39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${RECIPE_SYSROOT_NATIV=
E}::<wbr>g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${BASE_WORKDIR}/${<wbr=
>MULTIMACH_TARGET_SYS}::g&#39; \-e &#39;s/^Makefile:/_Makefile:/&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D \(.*\)/src=
dir =3D ./&#39; -e &#39;s/^top_srcdir =3D \(.*\)/top_srcdir =3D ./&#39; \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^builddir =3D \(.*\)/b=
uilddir =3D ./&#39; -e &#39;s/^top_builddir =3D \(.*\)/top_builddir =3D ./&=
#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${PTEST_PATH}/Makefile<br=
>
+}<br>
--<br>
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
</div></div></blockquote></div><br></div>

--001a113e919862a2d20567c6f0ac--
