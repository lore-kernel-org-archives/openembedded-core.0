Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5A4610F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:57:59 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id a2so13037182vso.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+D8Smhu3uPl+LcorhLVzqjPv9NjbO1w1NEcV73lUBqg=;
	b=Zk8qW/cSKWXMMoF1tZ03oJi732hO4APHh/HPFSTnoP/2I9tF3g+Sx/rR5UUxzjbcSG
	ACgB8l+87a4TReJYx+4x5D3Qi/IyDBBMKcfAC7rOtE5UfuhSeDHTYTza7Pn53y8oDbP6
	ioWi74GgQnoc1Ivk9+udW89Lm7GLKMU2+E8sTNESEm82Ej3hS54J+ppR896amTFIdiq4
	PAFUbUgu5W8VxVLZRQjvaBQRCjh63421gPbSQcX5ss5MnqMTS+HKJrZmOjPmy8iu75u2
	nJ7OQHBd6C38L/xezFWhmhuDkfmB7lVAQhQb15oDy/JKLgFoL3EOSm0yRqroq2VE8Ptc
	P8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+D8Smhu3uPl+LcorhLVzqjPv9NjbO1w1NEcV73lUBqg=;
	b=Foj2xFLtXDrgaQruKuerYoo1xxOqCpL0DEc1rkPNWmoLP1Ua3QxoYv9FS/H+02YS6z
	WaNPjcRrVQT3OsTNyKJsTL1j5YfiqfT4KQNd3Nhwwszs19m4t9uD8GuMdVdVaqpfXtiC
	SOn5Y4SyXzQG2CeOnmjzchf7XOKkE4ArUg8gS6O6Jtq0w3+PpTz3Z72h5Ci2i+XXJMMq
	yoZGAYcVMI8Oert7s0EU6KaDW6olsTEh8svCWAoO8q68fOVSjmgNG8a7uFMukPHsYTft
	6xk6YhW9ZN8yjfF0SDbWIjUi4N2sz9UIbYlT5ZXqrjuYTSwQ4CI1kqv3RnabIgygeAoD
	F6yQ==
X-Gm-Message-State: APjAAAVlGIWYYH9Np6YYBhc6l5gUsOQqdgSAzrA3xUW5+1YETa8vgu+V
	MCIjsiaS1Ipqm1d3lezMA9UvuIimOBCp2UboH80=
X-Google-Smtp-Source: APXvYqwlJc3sIS7K672sJQ6q9WV5Z86phAN3KXrleOcrhtcwJwZkIaFXu7lyjjT+qX68ifpAVBzDNt60oz+tWAUVuAg=
X-Received: by 2002:a67:7987:: with SMTP id u129mr11148371vsc.83.1582034280173;
	Tue, 18 Feb 2020 05:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20200218132606.22055-1-wallinux@gmail.com>
In-Reply-To: <20200218132606.22055-1-wallinux@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2020 14:58:25 +0100
Message-ID: <CANNYZj-OYVEPjz++CWf380PsjLN0+GYHVAMHTE8ch3_HbC727A@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added ptest
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
X-List-Received-Date: Tue, 18 Feb 2020 13:57:59 -0000
Content-Type: multipart/alternative; boundary="0000000000004ad3ed059eda0f01"

--0000000000004ad3ed059eda0f01
Content-Type: text/plain; charset="UTF-8"

You need to at the same time add the ptest package to PTESTS_FAST or
PTESTS_SLOW (depending on whether tests takes less or more than 30 seconds
to complete).
(I don't remember the exact filename in oe-core where the lists are defined
but you can easily grep for it)

Alex

On Tue, 18 Feb 2020 at 14:26, Anders Wallin <wallinux@gmail.com> wrote:

> Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ---
>  ...001-test_plugin-do-not-test-in-.libs.patch | 24 +++++++
>  .../lttng/babeltrace2/run-ptest               |  9 +++
>  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 70 ++++++++++++++++++-
>  3 files changed, 101 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
>  create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest
>
> diff --git
> a/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
> b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
> new file mode 100644
> index 0000000000..d1dbabab44
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
> @@ -0,0 +1,24 @@
> +From 49edc1efa64d7597f492c78b2b7c4b115c0a0ef7 Mon Sep 17 00:00:00 2001
> +Message-Id: <
> 49edc1efa64d7597f492c78b2b7c4b115c0a0ef7.1581587378.git.anders.wallin@windriver.com
> >
> +From: Anders Wallin <anders.wallin@windriver.com>
> +Date: Thu, 13 Feb 2020 10:49:28 +0100
> +Subject: [PATCH] test_plugin: do not test in .libs
> +
> +Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
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
> +-"${BT_TESTS_BUILDDIR}/lib/plugin"
> "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
> ++"${BT_TESTS_BUILDDIR}/lib/plugin"
> "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
> +--
> +2.25.0
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
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
> +makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD
> abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
> +
> +exec make -C tests -k -s $makeargs $target 2>/dev/null
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> index d49a96faff..43748b760a 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> @@ -7,13 +7,16 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
>
>  DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>
> -SRC_URI = "git://
> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
> +SRC_URI = "git://
> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
> +          file://run-ptest \
> +          file://0001-test_plugin-do-not-test-in-.libs.patch \
> +         "
>  SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  EXTRA_OECONF = "--disable-debug-info"
>
> @@ -24,3 +27,66 @@ FILES_${PN}-staticdev +=
> "${libdir}/babeltrace2/plugins/*.a"
>  FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
>
>  ASNEEDED = ""
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
> +    cp -a ${S}/tests/data/ctf-traces/*
> ${D}${PTEST_PATH}/tests/data/ctf-traces/
> +
> +    # Copy the tests directory tree and the executables and
> +    # Makefiles found within.
> +    install -D "${B}/tests/Makefile" "${D}${PTEST_PATH}/tests/"
> +    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ')
> ; do
> +       install -d "${D}${PTEST_PATH}/tests/$d"
> +       find "${B}/tests/$d" -maxdepth 1 -executable -type f \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
> +       test -r "${B}/tests/$d/Makefile" && \
> +           install -t "${D}${PTEST_PATH}/tests/$d"
> "${B}/tests/$d/Makefile"
> +       find "${B}/tests/$d" -maxdepth 1 -name *.sh \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +    done
> +
> +    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
> +       for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f
> -printf '%P ') ; do
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
> +    rm -rf
> ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
> +}
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004ad3ed059eda0f01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You need to at the same time add the ptest package to PTES=
TS_FAST or PTESTS_SLOW (depending on whether tests takes less or more than =
30 seconds to complete).<div>(I don&#39;t remember the exact filename in oe=
-core where the lists are defined but you can easily grep for it)</div><div=
><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, 18 Feb 2020 at 14:26, Anders Wallin &lt;<=
a href=3D"mailto:wallinux@gmail.com">wallinux@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,2=
04);padding-left:1ex">Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wa=
llinux@gmail.com" target=3D"_blank">wallinux@gmail.com</a>&gt;<br>
---<br>
=C2=A0...001-test_plugin-do-not-test-in-.libs.patch | 24 +++++++<br>
=C2=A0.../lttng/babeltrace2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 9 +++<br>
=C2=A0.../recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> | 70 +++++++++++=
+++++++-<br>
=C2=A03 files changed, 101 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-test_pl=
ugin-do-not-test-in-.libs.patch<br>
=C2=A0create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest<br=
>
<br>
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-=
test-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugi=
n-do-not-test-in-.libs.patch<br>
new file mode 100644<br>
index 0000000000..d1dbabab44<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in=
-.libs.patch<br>
@@ -0,0 +1,24 @@<br>
+From 49edc1efa64d7597f492c78b2b7c4b115c0a0ef7 Mon Sep 17 00:00:00 2001<br>
+Message-Id: &lt;<a href=3D"mailto:49edc1efa64d7597f492c78b2b7c4b115c0a0ef7=
.1581587378.git.anders.wallin@windriver.com" target=3D"_blank">49edc1efa64d=
7597f492c78b2b7c4b115c0a0ef7.1581587378.git.anders.wallin@windriver.com</a>=
&gt;<br>
+From: Anders Wallin &lt;<a href=3D"mailto:anders.wallin@windriver.com" tar=
get=3D"_blank">anders.wallin@windriver.com</a>&gt;<br>
+Date: Thu, 13 Feb 2020 10:49:28 +0100<br>
+Subject: [PATCH] test_plugin: do not test in .libs<br>
+<br>
+Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:anders.wallin@windriver=
.com" target=3D"_blank">anders.wallin@windriver.com</a>&gt;<br>
+---<br>
+ tests/lib/test_plugin | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin<br>
+index 652c90cc..1f817c50 100755<br>
+--- a/tests/lib/test_plugin<br>
++++ b/tests/lib/test_plugin<br>
+@@ -26,4 +26,4 @@ fi<br>
+ # shellcheck source=3D../utils/utils.sh<br>
+ source &quot;$UTILSSH&quot;<br>
+ <br>
+-&quot;${BT_TESTS_BUILDDIR}/lib/plugin&quot; &quot;${BT_TESTS_BUILDDIR}/li=
b/test-plugin-plugins/.libs&quot;<br>
++&quot;${BT_TESTS_BUILDDIR}/lib/plugin&quot; &quot;${BT_TESTS_BUILDDIR}/li=
b/test-plugin-plugins&quot;<br>
+-- <br>
+2.25.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes=
-kernel/lttng/babeltrace2/run-ptest<br>
new file mode 100755<br>
index 0000000000..72fe223436<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest<br>
@@ -0,0 +1,9 @@<br>
+#!/bin/sh<br>
+# use target=3Drecheck if you want to recheck failing tests<br>
+[ &quot;$target&quot; =3D &quot;&quot; ] &amp;&amp; target=3Dcheck<br>
+<br>
+# Without --ignore-exit, the tap harness causes any FAILs within a<br>
+# test plan to raise ERRORs; this is just noise.<br>
+makeargs=3D&quot;LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD ab=
s_top_builddir=3D$PWD GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3&quot;<br>
+<br>
+exec make -C tests -k -s $makeargs $target 2&gt;/dev/null<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> b/meta/re=
cipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
index d49a96faff..43748b760a 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
@@ -7,13 +7,16 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6a458c13=
f18385b7bc5069a6d7b176e&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native flex-native&q=
uot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/diamon/b=
abeltrace.git;branch=3Dstable-2.0" rel=3D"noreferrer" target=3D"_blank">git=
.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-2.0</a>&quot;<br=
>
+SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/diamon/b=
abeltrace.git;branch=3Dstable-2.0" rel=3D"noreferrer" target=3D"_blank">git=
.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-2.0</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_plugin-do-not-test-in-=
.libs.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;06df58f89ee51b1a2c6a2c187ec3f15691633910&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)$&qu=
ot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig ptest<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
<br>
@@ -24,3 +27,66 @@ FILES_${PN}-staticdev +=3D &quot;${libdir}/babeltrace2/p=
lugins/*.a&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/babeltrace2/plugins/*.so&quot;<br>
<br>
=C2=A0ASNEEDED =3D &quot;&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot;bash gawk python3&quot;<br>
+<br>
+do_compile_ptest () {<br>
+=C2=A0 =C2=A0 make -C tests all<br>
+}<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/tests&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Copy required files from source directory<br>
+=C2=A0 =C2=A0 for d in $(find &quot;${S}/tests&quot; -type d -printf &#39;=
%P &#39;) ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${PTEST_PATH}/tests/$d&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1 -exe=
cutable -type f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1 -nam=
e *.sh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} \;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1 -nam=
e *.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} \;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${S}/tests/$d&quot; -maxdepth 1 -nam=
e *.expect \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} \;<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/tests/data/ctf-traces/&qu=
ot;<br>
+=C2=A0 =C2=A0 cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/d=
ata/ctf-traces/<br>
+<br>
+=C2=A0 =C2=A0 # Copy the tests directory tree and the executables and<br>
+=C2=A0 =C2=A0 # Makefiles found within.<br>
+=C2=A0 =C2=A0 install -D &quot;${B}/tests/Makefile&quot; &quot;${D}${PTEST=
_PATH}/tests/&quot;<br>
+=C2=A0 =C2=A0 for d in $(find &quot;${B}/tests&quot; -type d -not -name .l=
ibs -printf &#39;%P &#39;) ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${PTEST_PATH}/tests/$d&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${B}/tests/$d&quot; -maxdepth 1 -exe=
cutable -type f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test -r &quot;${B}/tests/$d/Makefile&quot; &amp=
;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -t &quot;${D}${PTEST_PATH=
}/tests/$d&quot; &quot;${B}/tests/$d/Makefile&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${B}/tests/$d&quot; -maxdepth 1 -nam=
e *.sh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -t &quot;${D}${PTE=
ST_PATH}/tests/$d&quot; {} \;<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 for d in $(find &quot;${B}/tests&quot; -type d -name .libs -=
printf &#39;%P &#39;) ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in $(find &quot;${B}/tests/$d&quot; -maxd=
epth 1 -executable -type f -printf &#39;%P &#39;) ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/tests/$d/$f ${D}${PTEST_P=
ATH}/tests/`dirname $d`/$f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 # Prevent attempts to update Makefiles during test runs, and=
<br>
+=C2=A0 =C2=A0 # silence &quot;Making check in $SUBDIR&quot; messages.<br>
+=C2=A0 =C2=A0 find &quot;${D}${PTEST_PATH}&quot; -name Makefile -type f -e=
xec \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/Makefile:/,/^$/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/%: %.in/,/^$/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/echo &quot;Making $$target in $$subdi=
r&quot;; \\/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D \(.*\)/srcdir =3D ./&#39=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^builddir =3D \(.*\)/builddir =3D ./=
&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^all-am:.*/all-am:/&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {} +<br>
+<br>
+=C2=A0 =C2=A0 # Substitute links to installed binaries.<br>
+=C2=A0 =C2=A0 install -d &quot;${D}${PTEST_PATH}/src/cli/&quot;<br>
+=C2=A0 =C2=A0 ln -s &quot;${bindir}/babeltrace2&quot; ${D}${PTEST_PATH}/sr=
c/cli/<br>
+<br>
+=C2=A0 =C2=A0 # Remove architechture specific testfiles<br>
+=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.=
debug-info/*<br>
+}<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000004ad3ed059eda0f01--
