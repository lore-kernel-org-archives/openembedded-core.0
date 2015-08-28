Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 793CB71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:17 +0000 (UTC)
Received: by obbwr7 with SMTP id wr7so40704349obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 05:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4t1oEP93hDUuYtFXjW1oAK2CYoFshJ68AjIKVvigpzw=;
	b=UpZeoDPhRMzwvkolHpGfL1mgLDOkm7DY4mByose6b10qdtg45aGMVJ1uVid+Rd2XK+
	Dn9gxt0QXe5XZZccsqQy93WsmzfOGoP02GPXTRY16TKnoUeAyP+ciPtTDbKbwgXWTssP
	bnC5VrKZ/Kw6OoRivo1kdwBHDyB+0mrJrEXct544PJXPmTCAzKHpUP8SegkjwBt/MkII
	egZUgR9+mLUZjvSOt1PvkENw78qvfmF73XS8Y9Kc55KUe39zxMGYX2Zlql2qXwj8SyqT
	VQ58ER6iIq4/SHpdzzejTikHG7hNCPZE9ekvcr50GYtZI/qzDqJ0tgIC50YpRBarqveS
	XdBw==
X-Gm-Message-State: ALoCoQlHkw+Jgh3jun32vgiQHw+6CQcztLRCL3TQYB+oxwopEqytw4lpDkQDxlCumGTWnXDaW15/
X-Received: by 10.60.37.106 with SMTP id x10mr5244844oej.69.1440764237175;
	Fri, 28 Aug 2015 05:17:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 28 Aug 2015 05:16:47 -0700 (PDT)
In-Reply-To: <00ce510e20ccdd4e244ebc98d6ff3db2b38a338b.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
	<00ce510e20ccdd4e244ebc98d6ff3db2b38a338b.1440680489.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 28 Aug 2015 15:16:47 +0300
Message-ID: <CAHiDW_E868aK3UKv+G7-ycPF=iOT6pK4jH_3TtxsoevgmwAFMw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] nettle: Add ptests
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:19 -0000
Content-Type: multipart/alternative; boundary=089e013cc61c8ff764051e5e1030

--089e013cc61c8ff764051e5e1030
Content-Type: text/plain; charset=UTF-8

On 27 August 2015 at 16:06, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
> Use the nettle testsuite as ptests. Skip "sha1-huge-test" because
> it can take 20 minutes to finish.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  ...d-target-to-only-build-tests-not-run-them.patch | 43
++++++++++++++++++++++
>  meta/recipes-support/nettle/files/run-ptest        | 36
++++++++++++++++++
>  meta/recipes-support/nettle/nettle.inc             | 21 ++++++++++-
>  3 files changed, 98 insertions(+), 2 deletions(-)
>  create mode 100644
meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
>  create mode 100644 meta/recipes-support/nettle/files/run-ptest
>
> diff --git
a/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
b/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
> new file mode 100644
> index 0000000..9495d02
> --- /dev/null
> +++
b/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
> @@ -0,0 +1,43 @@
> +From 46edf01cc98db9f9feec984897836dfdd26bdc8d Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 12 Aug 2015 23:27:27 +0300
> +Subject: [PATCH] Add target to only build tests (not run them)
> +
> +Upstream-Status: ?

I've changed this to "Inappropriate" in the branch: it's not a complete
patch for installable tests (that upstream might be interested in) but it's
already useful for us.

> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + Makefile.in           | 3 +++
> + testsuite/Makefile.in | 2 ++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 08efb7d..7909342 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -55,6 +55,9 @@ clean distclean mostlyclean maintainer-clean tags:
> +         echo "Making $@ in $d" ; (cd $d && $(MAKE) $@); done
> +       $(MAKE) $@-here
> +
> ++buildtest:
> ++      echo "Making $@ in testsuite" ; (cd testsuite && $(MAKE) $@)
> ++
> + check-here:
> +       true
> +
> +diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
> +index 6bc1907..bb65bf0 100644
> +--- a/testsuite/Makefile.in
> ++++ b/testsuite/Makefile.in
> +@@ -116,6 +116,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT)
../nettle-internal.$(OBJEXT) \
> + # data.
> + VALGRIND = valgrind --error-exitcode=1 --leak-check=full
--show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
> +
> ++buildtest: $(TS_ALL)
> ++
> + # The PATH update is for locating dlls on w*ndows.
> + check: $(TS_ALL)
> +       LD_LIBRARY_PATH=../.lib PATH="../.lib:$PATH" srcdir="$(srcdir)" \
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-support/nettle/files/run-ptest
b/meta/recipes-support/nettle/files/run-ptest
> new file mode 100644
> index 0000000..b90bed6
> --- /dev/null
> +++ b/meta/recipes-support/nettle/files/run-ptest
> @@ -0,0 +1,36 @@
> +#! /bin/sh
> +
> +cd testsuite
> +
> +failed=0
> +all=0
> +
> +for f in *-test; do
> +    if [ "$f" = "sha1-huge-test" ] ; then
> +        echo "SKIP: $f (skipped for ludicrous run time)"
> +        continue
> +    fi
> +
> +    "./$f"
> +    case "$?" in
> +        0)
> +            echo "PASS: $f"
> +            all=$((all + 1))
> +            ;;
> +        77)
> +            echo "SKIP: $f"
> +            ;;
> +        *)
> +            echo "FAIL: $f"
> +            failed=$((failed + 1))
> +            all=$((all + 1))
> +            ;;
> +    esac
> +done
> +
> +if [ "$failed" -eq 0 ] ; then
> +  echo "All $all tests passed"
> +else
> +  echo "$failed of $all tests failed"
> +fi
> +
> diff --git a/meta/recipes-support/nettle/nettle.inc
b/meta/recipes-support/nettle/nettle.inc
> index 0579b6c..fafff6d 100644
> --- a/meta/recipes-support/nettle/nettle.inc
> +++ b/meta/recipes-support/nettle/nettle.inc
> @@ -8,19 +8,36 @@ LIC_FILES_CHKSUM =
"file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>
>  DEPENDS += "gmp"
>
> -SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
> +SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
> +           file://Add-target-to-only-build-tests-not-run-them.patch \
> +           file://run-ptest \
> +           "
>
>  SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
>  SRC_URI[sha256sum] =
"bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
>
>  EXTRA_OECONF = "--disable-openssl"
>
> +inherit autotools ptest
> +
>  do_configure_prepend() {
>         if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
>                 cp ${S}/aclocal.m4 ${S}/acinclude.m4
>         fi
>  }
>
> -inherit autotools
> +do_compile_ptest() {
> +        oe_runmake buildtest
> +}
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/testsuite/
> +        install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
> +        install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
> +        # tools can be found in PATH, not in ../tools/
> +        sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
> +        install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
> +}
> +
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.1.4
>

--089e013cc61c8ff764051e5e1030
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 27 August 2015 at 16:06, Jussi Kukkonen &lt;<a =
href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; w=
rote:<br>&gt;<br>&gt; Use the nettle testsuite as ptests. Skip &quot;sha1-h=
uge-test&quot; because<br>&gt; it can take 20 minutes to finish.<br>&gt;<br=
>&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com">jussi.kukkonen@intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0...d-ta=
rget-to-only-build-tests-not-run-them.patch | 43 ++++++++++++++++++++++<br>=
&gt; =C2=A0meta/recipes-support/nettle/files/run-ptest =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 36 ++++++++++++++++++<br>&gt; =C2=A0meta/recipes-support/nettle/ne=
ttle.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 ++++++++++-<br>&gt;=
 =C2=A03 files changed, 98 insertions(+), 2 deletions(-)<br>&gt; =C2=A0crea=
te mode 100644 meta/recipes-support/nettle/files/Add-target-to-only-build-t=
ests-not-run-them.patch<br>&gt; =C2=A0create mode 100644 meta/recipes-suppo=
rt/nettle/files/run-ptest<br>&gt;<br>&gt; diff --git a/meta/recipes-support=
/nettle/files/Add-target-to-only-build-tests-not-run-them.patch b/meta/reci=
pes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch<=
br>&gt; new file mode 100644<br>&gt; index 0000000..9495d02<br>&gt; --- /de=
v/null<br>&gt; +++ b/meta/recipes-support/nettle/files/Add-target-to-only-b=
uild-tests-not-run-them.patch<br>&gt; @@ -0,0 +1,43 @@<br>&gt; +From 46edf0=
1cc98db9f9feec984897836dfdd26bdc8d Mon Sep 17 00:00:00 2001<br>&gt; +From: =
Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkon=
en@intel.com</a>&gt;<br>&gt; +Date: Wed, 12 Aug 2015 23:27:27 +0300<br>&gt;=
 +Subject: [PATCH] Add target to only build tests (not run them)<br>&gt; +<=
br>&gt; +Upstream-Status: ?<br><br>I&#39;ve changed this to &quot;Inappropr=
iate&quot; in the branch: it&#39;s not a complete patch for installable tes=
ts (that upstream might be interested in) but it&#39;s already useful for u=
s.<br><br>&gt; +Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.k=
ukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>&gt; +---<br>&gt; + =
Makefile.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>&gt; + testsuite/=
Makefile.in | 2 ++<br>&gt; + 2 files changed, 5 insertions(+)<br>&gt; +<br>=
&gt; +diff --git a/Makefile.in b/Makefile.in<br>&gt; +index 08efb7d..790934=
2 100644<br>&gt; +--- a/Makefile.in<br>&gt; ++++ b/Makefile.in<br>&gt; +@@ =
-55,6 +55,9 @@ clean distclean mostlyclean maintainer-clean tags:<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Making $@ in $d&quot; ; (cd $d &amp=
;&amp; $(MAKE) $@); done<br>&gt; + =C2=A0 =C2=A0 =C2=A0 $(MAKE) $@-here<br>=
&gt; +<br>&gt; ++buildtest:<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0echo &quot;Makin=
g $@ in testsuite&quot; ; (cd testsuite &amp;&amp; $(MAKE) $@)<br>&gt; ++<b=
r>&gt; + check-here:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 true<br>&gt; +<br>&gt; =
+diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in<br>&gt; +index =
6bc1907..bb65bf0 100644<br>&gt; +--- a/testsuite/Makefile.in<br>&gt; ++++ b=
/testsuite/Makefile.in<br>&gt; +@@ -116,6 +116,8 @@ $(TARGETS) $(EXTRA_TARG=
ETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \<br>&gt; + # data.<=
br>&gt; + VALGRIND =3D valgrind --error-exitcode=3D1 --leak-check=3Dfull --=
show-reachable=3Dyes @IF_ASM@ --partial-loads-ok=3Dyes<br>&gt; +<br>&gt; ++=
buildtest: $(TS_ALL)<br>&gt; ++<br>&gt; + # The PATH update is for locating=
 dlls on w*ndows.<br>&gt; + check: $(TS_ALL)<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 LD_LIBRARY_PATH=3D../.lib PATH=3D&quot;../.lib:$PATH&quot; srcdir=3D&quot;=
$(srcdir)&quot; \<br>&gt; +--<br>&gt; +2.1.4<br>&gt; +<br>&gt; diff --git a=
/meta/recipes-support/nettle/files/run-ptest b/meta/recipes-support/nettle/=
files/run-ptest<br>&gt; new file mode 100644<br>&gt; index 0000000..b90bed6=
<br>&gt; --- /dev/null<br>&gt; +++ b/meta/recipes-support/nettle/files/run-=
ptest<br>&gt; @@ -0,0 +1,36 @@<br>&gt; +#! /bin/sh<br>&gt; +<br>&gt; +cd te=
stsuite<br>&gt; +<br>&gt; +failed=3D0<br>&gt; +all=3D0<br>&gt; +<br>&gt; +f=
or f in *-test; do<br>&gt; + =C2=A0 =C2=A0if [ &quot;$f&quot; =3D &quot;sha=
1-huge-test&quot; ] ; then<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
SKIP: $f (skipped for ludicrous run time)&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue<br>&gt; + =C2=A0 =C2=A0fi<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0&quot;./$f&quot;<br>&gt; + =C2=A0 =C2=A0case &quot;$?&quot; in<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;PASS: $f&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0all=3D$((all + 1))<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0;;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A077)<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;SKIP: $f&quot;<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: $f&quot;=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed=3D$((failed + 1)=
)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all=3D$((all + 1))<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>&gt; + =C2=A0 =C2=A0e=
sac<br>&gt; +done<br>&gt; +<br>&gt; +if [ &quot;$failed&quot; -eq 0 ] ; the=
n<br>&gt; + =C2=A0echo &quot;All $all tests passed&quot;<br>&gt; +else<br>&=
gt; + =C2=A0echo &quot;$failed of $all tests failed&quot;<br>&gt; +fi<br>&g=
t; +<br>&gt; diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/rec=
ipes-support/nettle/nettle.inc<br>&gt; index 0579b6c..fafff6d 100644<br>&gt=
; --- a/meta/recipes-support/nettle/nettle.inc<br>&gt; +++ b/meta/recipes-s=
upport/nettle/nettle.inc<br>&gt; @@ -8,19 +8,36 @@ LIC_FILES_CHKSUM =3D &qu=
ot;file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \<br>&gt;<br>&=
gt; =C2=A0DEPENDS +=3D &quot;gmp&quot;<br>&gt;<br>&gt; -SRC_URI =3D &quot;<=
a href=3D"http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz">http://www=
.lysator.liu.se/~nisse/archive/${BP}.tar.gz</a>&quot;<br>&gt; +SRC_URI =3D =
&quot;<a href=3D"http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz">htt=
p://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz</a> \<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Add-target-to-only-build-tests-not-run-t=
hem.patch \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>&gt;<br>&gt; =C2=A0=
SRC_URI[md5sum] =3D &quot;003d5147911317931dd453520eb234a5&quot;<br>&gt; =
=C2=A0SRC_URI[sha256sum] =3D &quot;bc71ebd43435537d767799e414fce88e521b7278=
d48c860651216e1fc6555b40&quot;<br>&gt;<br>&gt; =C2=A0EXTRA_OECONF =3D &quot=
;--disable-openssl&quot;<br>&gt;<br>&gt; +inherit autotools ptest<br>&gt; +=
<br>&gt; =C2=A0do_configure_prepend() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/aclocal.m4 ${S}/ac=
include.m4<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=A0}<br>&gt;<b=
r>&gt; -inherit autotools<br>&gt; +do_compile_ptest() {<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0oe_runmake buildtest<br>&gt; +}<br>&gt; +<br>&gt; +do_i=
nstall_ptest() {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTES=
T_PATH}/testsuite/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/testsu=
ite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0# tools can be found in PATH, not in ../tool=
s/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|../tools/||&#39; $=
{D}${PTEST_PATH}/testsuite/*-test<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0inst=
all ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/<br>&gt; +}<br>&gt; +=
<br>&gt;<br>&gt; =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>&g=
t; --<br>&gt; 2.1.4<br>&gt;<br></div>

--089e013cc61c8ff764051e5e1030--
