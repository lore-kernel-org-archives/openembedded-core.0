Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2AF611D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 18:13:20 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id t129so1063920vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jqsu3vYrVrMn2HCh50KLVxAdLgiX2KdjMGVNU4VbgjE=;
	b=dWhVJd+hUdsYZo0lW2c+5TPWYcCpwrtKZjOk9PTAckTh7+xXEcugMQSLeYdl/tmxaL
	CjLuEGMCL2FbG4dEg/WTYXbnzyCVCCPz/sjB89EjN+GvCTAVNuRzFkoKuk6UDrcG8Hcp
	KCV1K0Wo8g+8U+gdUXNjAgaXDK6Q7Cvrkufz3XC5tWltvcEHP2+g06AU2HzKtC2zSkdG
	HYf1EXK1QtzS6hvty4x+LoDcb773FoKMNXVqXExyKxZbXuT3fEZWMQpghxvDQJbCuXx3
	lZnO6YID1ERDBsBKgFy6YqML65Ah6AIvITZpGQ0BVAVFvAh+Fz1OoXzQKnXNFW2NbKU3
	NcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jqsu3vYrVrMn2HCh50KLVxAdLgiX2KdjMGVNU4VbgjE=;
	b=QTpYKIFQeFzEdsE3UPX/87M5efw7SnTisKoXHfwYQwIrKp/EKYnf6xW3zzuI6nQ2bg
	SfkKWSQoZKaK336geZUjO78BgF7fLgGpxIbkH/4WDL28i8kPB9tCoqq5seS3pgPwSWgI
	lM4Dkw8Z4i+Rgktp6JXdvmhi8LwJ8jsL22Ak7jdvT1VmMf/OLl/4ijhXLYcHyk/nwLLf
	L0F69p7s0YSXLJ3QnGsD8xm2sK8ADtbtpOIK+N16YzLYb4Ayc55i/c92PQeSHwNhx523
	qCb8EGwCch98rhV50mi6quFuj4Po15PynUiL16Cq3Kckh0h0AwRNPrjstaM7kN1hUqzR
	T7OQ==
X-Gm-Message-State: APjAAAXhHamfTvYrnHdIC4zFkBk2xgzXsZevEiHBXVC6uEE2IXK4NqwX
	171EtT/S2MJknabYqW1BPokqacdaqP/0izbFo2w=
X-Google-Smtp-Source: APXvYqw3xfr0Ts1B6J9JI9ioJFDTNg1SV+GH7NEcWXaCf7JwL2PbNuKGqFb3OGoLO4mpZ/GqKzG5k15VRr3VuEVCKc4=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr280676vkc.29.1582740801382; 
	Wed, 26 Feb 2020 10:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20200226180746.121476-1-trevor.gamblin@windriver.com>
	<20200226180746.121476-2-trevor.gamblin@windriver.com>
In-Reply-To: <20200226180746.121476-2-trevor.gamblin@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Feb 2020 19:13:09 +0100
Message-ID: <CANNYZj-EJ8kzbvRd5fnb2HKGUHFVnmnZfMfta99cFxO+q8Abpw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v3] coreutils: add ptest
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
X-List-Received-Date: Wed, 26 Feb 2020 18:13:21 -0000
Content-Type: multipart/alternative; boundary="0000000000003cef10059f7e8f2d"

--0000000000003cef10059f7e8f2d
Content-Type: text/plain; charset="UTF-8"

valgrind, gdb and strace are already pulled into core-image-sato-sdk-ptest
(the one that runs the slow ptests on the AB), so there is no harm in
adding them here as well.

Alex

On Wed, 26 Feb 2020 at 19:08, Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> coreutils has a large number of tests, including some added by the
> Makefile flags RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that
> significantly increase runtime (and which have been disabled). Note
> that the coreutils ptest directory is given blanket permissions at
> runtime with chmod -R 777, to ensure that the user created for the
> tests will be able to run the test scripts and create the necessary
> files in the process without being impeded by permissions issues.
>
> There is still room to improve the results of this ptest without
> the aforementioned additions. Of the tests marked SKIP, there are
> 30 tests that are currently counted as SKIP because they require
> sudo permissions, and another 21 that require membership in
> multiple user groups. It is important to know that coreutils has
> tests for both root and non-root users. Testing showed that 42
> tests are skipped when running as root versus 30 when running as a
> non-root user, so the decision was made to run the suite as the
> latter. Additionally, gdb, valgrind, and strace could be included
> in the RDEPENDS list to increase pass rate, but their total
> contribution is 13 tests, so they were omitted to reduce image size.
>
> Finally, note that at least one ptest (misc/head-write-error.sh) is
> prone to ERROR on builds of core-image-minimal if extra space is
> not provided with IMAGE_ROOTFS_EXTRA_SPACE.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../coreutils/coreutils/run-ptest             | 17 +++++++++
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 37 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
>
> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest
> b/meta/recipes-core/coreutils/coreutils/run-ptest
> new file mode 100755
> index 0000000000..6d4a7b365d
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +
> +# remove any stale lock files so that the calls to groupadd/useradd don't
> stop
> +# the ptest if re-using the same image
> +rm -rf /etc/passwd.lock /etc/group.lock /etc/gshadow.lock
> +
> +COREUTILSLIB=@libdir@/coreutils
> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
> +USERNAME="tester"
> +groupadd ugroup1
> +groupadd ugroup2
> +useradd -G ugroup1,ugroup2 $USERNAME || echo "user $USERNAME already
> exists"
> +
> +su tester -c "cd ${COREUTILSLIB}/ptest && make check-TESTS top_srcdir=.
> srcdir=." 2>&1 | tee -a ${LOG}
> +userdel $USERNAME
> +groupdel ugroup1
> +groupdel ugroup2
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
> b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..8bec4e0f3c 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>
> file://0001-uname-report-processor-and-hardware-correctly.patch \
>             file://disable-ls-output-quoting.patch \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
> +           file://run-ptest \
>            "
>
>  SRC_URI_append_libc-musl = "file://strtod_fix_clash_with_strtold.patch"
> @@ -143,3 +144,39 @@ python __anonymous() {
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +inherit ptest
> +
> +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl
> libmodule-build-perl make perl perl-module-file-stat python3-core sed
> shadow"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
> +    sed -i 's/ginstall/install/g'  `grep -R ginstall
> ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
> +    install -d ${D}${PTEST_PATH}/build-aux
> +    install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> +    cp ${B}/Makefile ${D}${PTEST_PATH}/
> +    cp ${S}/init.cfg ${D}${PTEST_PATH}/
> +    cp -r ${B}/src ${D}${PTEST_PATH}/
> +    cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
> +    sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g'
> ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g'
> ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^built_programs/s/ginstall/install/g'
> ${D}${PTEST_PATH}/Makefile
> +    chmod -R 777 ${D}${PTEST_PATH}
> +
> +    # Disable subcase stty-pairs.sh, it will cause test framework hang
> +    sed -i '/stty-pairs.sh/d' ${D}${PTEST_PATH}/Makefile
> +
> +    # Tweak test d_type-check to use python3 instead of python
> +    sed -i "1s@.*@#!/usr/bin/python3@"
> ${WORKDIR}/image/usr/lib/coreutils/ptest/tests/d_type-check
> +    install ${B}/src/getlimits ${D}/${bindir}
> +
> +    # handle multilib
> +    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> +}
> +
> +FILES_${PN}-ptest += "${bindir}/getlimits"
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003cef10059f7e8f2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">valgrind, gdb and strace are already pulled into core-imag=
e-sato-sdk-ptest (the one that runs the slow ptests on the AB), so there is=
 no harm in adding them here as well.<br><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, 26 Feb 2020 at 19:08, Trevor Gamblin &lt;<a href=3D"mailto:trevor.g=
amblin@windriver.com">trevor.gamblin@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">coreutils has a large num=
ber of tests, including some added by the<br>
Makefile flags RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that<br>
significantly increase runtime (and which have been disabled). Note<br>
that the coreutils ptest directory is given blanket permissions at<br>
runtime with chmod -R 777, to ensure that the user created for the<br>
tests will be able to run the test scripts and create the necessary<br>
files in the process without being impeded by permissions issues.<br>
<br>
There is still room to improve the results of this ptest without<br>
the aforementioned additions. Of the tests marked SKIP, there are<br>
30 tests that are currently counted as SKIP because they require<br>
sudo permissions, and another 21 that require membership in<br>
multiple user groups. It is important to know that coreutils has<br>
tests for both root and non-root users. Testing showed that 42<br>
tests are skipped when running as root versus 30 when running as a<br>
non-root user, so the decision was made to run the suite as the<br>
latter. Additionally, gdb, valgrind, and strace could be included<br>
in the RDEPENDS list to increase pass rate, but their total<br>
contribution is 13 tests, so they were omitted to reduce image size.<br>
<br>
Finally, note that at least one ptest (misc/head-write-error.sh) is<br>
prone to ERROR on builds of core-image-minimal if extra space is<br>
not provided with IMAGE_ROOTFS_EXTRA_SPACE.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../coreutils/coreutils/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 17 +++++++++<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a> | 37 ++++++++++++++=
+++++<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest<br=
>
<br>
diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes=
-core/coreutils/coreutils/run-ptest<br>
new file mode 100755<br>
index 0000000000..6d4a7b365d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/coreutils/coreutils/run-ptest<br>
@@ -0,0 +1,17 @@<br>
+#!/bin/sh<br>
+<br>
+# remove any stale lock files so that the calls to groupadd/useradd don&#3=
9;t stop<br>
+# the ptest if re-using the same image<br>
+rm -rf /etc/passwd.lock /etc/group.lock /etc/gshadow.lock<br>
+<br>
+COREUTILSLIB=3D@libdir@/coreutils<br>
+LOG=3D&quot;${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).l=
og&quot;<br>
+USERNAME=3D&quot;tester&quot;<br>
+groupadd ugroup1<br>
+groupadd ugroup2<br>
+useradd -G ugroup1,ugroup2 $USERNAME || echo &quot;user $USERNAME already =
exists&quot;<br>
+<br>
+su tester -c &quot;cd ${COREUTILSLIB}/ptest &amp;&amp; make check-TESTS to=
p_srcdir=3D. srcdir=3D.&quot; 2&gt;&amp;1 | tee -a ${LOG}<br>
+userdel $USERNAME <br>
+groupdel ugroup1<br>
+groupdel ugroup2<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.b=
b" rel=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">coreutils_8.31.bb</a><br>
index 57b2c1bdba..8bec4e0f3c 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/coreutils/${BP}.tar.xz \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-uname-report-processo=
r-and-hardware-correctly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-ls-output-quoting.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-local.mk-fix-cross-co=
mpiling-problem.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot;file://strtod_fix_clash_with_strto=
ld.patch&quot;<br>
@@ -143,3 +144,39 @@ python __anonymous() {<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+inherit ptest<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot;bash findutils gawk liberror-perl libmodul=
e-build-perl make perl perl-module-file-stat python3-core sed shadow&quot;<=
br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 sed -i &#39;s/ginstall/install/g&#39;=C2=A0 `grep -R ginstal=
l ${D}${PTEST_PATH}/tests | awk -F: &#39;{print $1}&#39; | uniq`<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/build-aux<br>
+=C2=A0 =C2=A0 install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-a=
ux/<br>
+=C2=A0 =C2=A0 cp ${B}/Makefile ${D}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 cp ${S}/init.cfg ${D}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 cp -r ${B}/src ${D}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src<br>
+=C2=A0 =C2=A0 sed -i &#39;/^VPATH/s/=3D .*$/=3D ./g&#39; ${D}${PTEST_PATH}=
/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;/^PROGRAMS/s/^/#/g&#39; ${D}${PTEST_PATH}/Makefi=
le<br>
+=C2=A0 =C2=A0 sed -i &#39;/^Makefile: /s/^.*$/Makefile:/g&#39; ${D}${PTEST=
_PATH}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;/^abs_srcdir/s/=3D .*$/=3D \$\{PWD\}/g&#39; ${D}=
${PTEST_PATH}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;/^abs_top_builddir/s/=3D .*$/=3D \$\{PWD\}/g&#39=
; ${D}${PTEST_PATH}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;/^abs_top_srcdir/s/=3D .*$/=3D \$\{PWD\}/g&#39; =
${D}${PTEST_PATH}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;/^built_programs/s/ginstall/install/g&#39; ${D}$=
{PTEST_PATH}/Makefile<br>
+=C2=A0 =C2=A0 chmod -R 777 ${D}${PTEST_PATH}<br>
+<br>
+=C2=A0 =C2=A0 # Disable subcase stty-pairs.sh, it will cause test framewor=
k hang<br>
+=C2=A0 =C2=A0 sed -i &#39;/<a href=3D"http://stty-pairs.sh/d" rel=3D"noref=
errer" target=3D"_blank">stty-pairs.sh/d</a>&#39; ${D}${PTEST_PATH}/Makefil=
e<br>
+<br>
+=C2=A0 =C2=A0 # Tweak test d_type-check to use python3 instead of python<b=
r>
+=C2=A0 =C2=A0 sed -i &quot;1s@.*@#!/usr/bin/python3@&quot; ${WORKDIR}/imag=
e/usr/lib/coreutils/ptest/tests/d_type-check<br>
+=C2=A0 =C2=A0 install ${B}/src/getlimits ${D}/${bindir}<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 # handle multilib<br>
+=C2=A0 =C2=A0 sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest<br=
>
+}<br>
+<br>
+FILES_${PN}-ptest +=3D &quot;${bindir}/getlimits&quot;<br>
-- <br>
2.24.1<br>
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

--0000000000003cef10059f7e8f2d--
