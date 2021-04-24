Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.1342.1619284706312875738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 10:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NBz37iOl;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id y136so20631274qkb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z8xr59Pq2s1IZt3o+sb/eYewO41hARZNeh3p/gjoxBU=;
        b=NBz37iOlNwL5xkCJrCAGO19pL0l6kmWSZQg4i8o0M6cDpDCYiZS5tjN97rSVapTfV+
         SowspMYd5lcO+IukDxM0XyLuR38nG5MshibHk2anYerGhbdr8Xnw/WL738O6Dt99sDFJ
         R+i9lH9ActivYBuAYDVzo+/k3zTEVJHYvN3K+MTgkQvc3wOuppZYP6EobWpyRemyA1vZ
         ZKCcNqaTzKZz561BT82U4fYVZCfHISUVhx12tl1Jh0JG5iA7cwLqXAl+a5fqewlbLZfp
         7SunvEZ1bIF6x/cygQ+uO7V/6q8r9ySN5ucVyiuxR0Pv5cDX8KJjS/vf1biAW0vzXCIl
         GF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z8xr59Pq2s1IZt3o+sb/eYewO41hARZNeh3p/gjoxBU=;
        b=oyDf1pI6vJLlnexsJFe58IvS4N4HNjEGguPC4xTeUGA73T8HauB5DD5maeZpb6EX2K
         GclysJ3tEnxarcKlUXyvu1SfHehCE6evBt31Ll09iS7MdrYfLJgsgyKsuR3Vn3OryQRH
         zet+EHO6iCLB3YDJCEF/1duAGSNja2n2S8Higz1WaKh9Gde/EaD4rP2J9DE3ZMgk/oMp
         3uGE0tTXxLhcvIARa2xRLp+tz1NTbrdD0+c9gK8hDOWvSdqwOiQbwru4J4q8oR6q4FCB
         cB6VZBsixFnN4H44SNqz+IX+1QaLEM5/ljYWKGJAGdsHZC50qxIDfzhRZ0jxewOrrXRl
         MVAA==
X-Gm-Message-State: AOAM532ASvl/9dZlEUIEC8JBQvRGP46l/RSShyditdbpBZvVMeO61lDu
	3Im6cpKE6Ub170P8jyJm9hrHft5F++cJx1PI2fI=
X-Google-Smtp-Source: ABdhPJxJNZYne16CuBOBKlEuLaqNrFgT6edEakCuFbEapiPWltJcCVYTFVvE3w3lVJ+JPqLepLPjuAbJ4bELsMkbTx8=
X-Received: by 2002:a37:a6d2:: with SMTP id p201mr9559570qke.146.1619284705317;
 Sat, 24 Apr 2021 10:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com> <CAMKF1spzMi=8N1+GevuLQzykUXdmaLyDDOPYh64uPEqpKYS8sw@mail.gmail.com>
 <a5ec37e7-b020-89a2-9c54-b70a37bec44a@gmail.com>
In-Reply-To: <a5ec37e7-b020-89a2-9c54-b70a37bec44a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 10:18:14 -0700
Message-ID: <CAMKF1sqYXPXL5PfoVeBTvz4zRzrCXU0fbRz4g6RYYQCr1LuoVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6984c05c0bb19d9"

--000000000000a6984c05c0bb19d9
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 24, 2021 at 9:55 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/24/21 9:19 AM, Khem Raj wrote:
> > On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com>
> wrote:
> >> ptest results:
> >> Regression Test Summary
> >>  tests run: 1404
> >>  tests skipped: 369
> >>  tests passed: 1402
> >>  tests failed: 2
> >>  tests errored: 154
> >>
> >> Add feature_check so that the other recipes who can take
> >> advantage of this funtionality can enable it.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  .../libseccomp/files/run-ptest                |  4 ++
> >>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
> >>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >>
> >> diff --git a/meta/recipes-support/libseccomp/files/run-ptest
> b/meta/recipes-support/libseccomp/files/run-ptest
> >> new file mode 100644
> >> index 00000000000..54b4a63cd2c
> >> --- /dev/null
> >> +++ b/meta/recipes-support/libseccomp/files/run-ptest
> >> @@ -0,0 +1,4 @@
> >> +#!/bin/sh
> >> +
> >> +cd tests
> >> +./regression -a
> >> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >> new file mode 100644
> >> index 00000000000..667d5da8242
> >> --- /dev/null
> >> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >> @@ -0,0 +1,49 @@
> >> +SUMMARY = "interface to seccomp filtering mechanism"
> >> +DESCRIPTION = "The libseccomp library provides and easy to use,
> platform independent,interface to the Linux Kernel's syscall filtering
> mechanism: seccomp."
> >> +SECTION = "security"
> >> +LICENSE = "LGPL-2.1"
> >> +LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> >> +
> >> +DEPENDS += "gperf-native"
> >> +
> >> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> >> +
> >> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5
> \
> >> +           file://run-ptest \
> >> +           "
> >> +
> >> +COMPATIBLE_HOST_riscv32 = "null"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit autotools-brokensep pkgconfig ptest features_check
> >> +
> >> +REQUIRED_DISTRO_FEATURES = "seccomp"
> >> +
> >> +PACKAGECONFIG ??= ""
> >> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
> >> +
> >> +DISABLE_STATIC = ""
> > do we need apps to use some static libs ? if so which library is it,
> > Or is it all internal?
>
> The commit that added that:
>
> commit 2153c59b429293120095a2bd4562f4f7553c1ae7
> Author: Stefan Agner <stefan.agner@toradex.com>
> Date:   Sun Sep 1 21:48:13 2019 +0200
>
>     libseccomp: build static library always
>
>     Always build static library. This is required e.g. for runc from
>     meta-virtualization in its default configuration.
>
> Meta-virt is one of the reasons I am this patch set.
>

Ok since it can silently link to any app perhaps turning this into a
packageconfig could be a good improvement

>
> -armin
> >
> >> +
> >> +do_compile_ptest() {
> >> +    oe_runmake -C tests check-build
> >> +}
> >> +
> >> +do_install_ptest() {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    install -d ${D}${PTEST_PATH}/tools
> >> +    for file in $(find tests/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tests/*.tests -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tools/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> >> +    done
> >> +}
> >> +
> >> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> >> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/*
> ${libdir}/${PN}/tools/.debug"
> >> +
> >> +RDEPENDS_${PN}-ptest = "coreutils bash"
> >> --
> >> 2.25.1
> >>
> >>
> >> 
> >>
>
>

--000000000000a6984c05c0bb19d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Apr 24, 2021 at 9:55 AM akuster808 &lt;<a href=3D"=
mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
On 4/24/21 9:19 AM, Khem Raj wrote:<br>
&gt; On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster &lt;<a href=3D"mailto:ak=
uster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; ptest results:<br>
&gt;&gt; Regression Test Summary<br>
&gt;&gt;=C2=A0 tests run: 1404<br>
&gt;&gt;=C2=A0 tests skipped: 369<br>
&gt;&gt;=C2=A0 tests passed: 1402<br>
&gt;&gt;=C2=A0 tests failed: 2<br>
&gt;&gt;=C2=A0 tests errored: 154<br>
&gt;&gt;<br>
&gt;&gt; Add feature_check so that the other recipes who can take<br>
&gt;&gt; advantage of this funtionality can enable it.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../libseccomp/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;&gt;=C2=A0 .../libseccomp/<a href=3D"http://libseccomp_2.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 | 49 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 53 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/libseccomp/files/ru=
n-ptest<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/libseccomp/<a href=
=3D"http://libseccomp_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libse=
ccomp_2.5.1.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/me=
ta/recipes-support/libseccomp/files/run-ptest<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..54b4a63cd2c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/libseccomp/files/run-ptest<br>
&gt;&gt; @@ -0,0 +1,4 @@<br>
&gt;&gt; +#!/bin/sh<br>
&gt;&gt; +<br>
&gt;&gt; +cd tests<br>
&gt;&gt; +./regression -a<br>
&gt;&gt; diff --git a/meta/recipes-support/libseccomp/<a href=3D"http://li=
bseccomp_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb=
</a> b/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..667d5da8242<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/libseccomp/<a href=3D"http://libseccom=
p_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br=
>
&gt;&gt; @@ -0,0 +1,49 @@<br>
&gt;&gt; +SUMMARY =3D &quot;interface to seccomp filtering mechanism&quot;=
<br>
&gt;&gt; +DESCRIPTION =3D &quot;The libseccomp library provides and easy t=
o use, platform independent,interface to the Linux Kernel&#39;s syscall fil=
tering mechanism: seccomp.&quot;<br>
&gt;&gt; +SECTION =3D &quot;security&quot;<br>
&gt;&gt; +LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D0;endline=
=3D1;md5=3D8eac08d22113880357ceb8e7c37f989f&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS +=3D &quot;gperf-native&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRCREV =3D &quot;4bf70431a339a2886ab8c82e9a45378f30c6e6c7&quot;<=
br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/seccomp/lib=
seccomp.git;branch=3Drelease-2.5" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/seccomp/libseccomp.git;branch=3Drelease-2.5</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +COMPATIBLE_HOST_riscv32 =3D &quot;null&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit autotools-brokensep pkgconfig ptest features_check<br>
&gt;&gt; +<br>
&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;seccomp&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt;&gt; +PACKAGECONFIG[python] =3D &quot;--enable-python, --disable-pytho=
n, python3&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +DISABLE_STATIC =3D &quot;&quot;<br>
&gt; do we need apps to use some static libs ? if so which library is it,<=
br>
&gt; Or is it all internal?<br>
<br>
The commit that added that:<br>
<br>
commit 2153c59b429293120095a2bd4562f4f7553c1ae7<br>
Author: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com" targe=
t=3D"_blank">stefan.agner@toradex.com</a>&gt;<br>
Date:=C2=A0=C2=A0 Sun Sep 1 21:48:13 2019 +0200<br>
<br>
=C2=A0=C2=A0=C2=A0 libseccomp: build static library always<br>
=C2=A0=C2=A0=C2=A0<br>
=C2=A0=C2=A0=C2=A0 Always build static library. This is required e.g. for =
runc from<br>
=C2=A0=C2=A0=C2=A0 meta-virtualization in its default configuration.<br>
<br>
Meta-virt is one of the reasons I am this patch set.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok since it can=
 silently link to any app perhaps turning this into a packageconfig could b=
e a good improvement=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-armin<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +do_compile_ptest() {<br>
&gt;&gt; +=C2=A0 =C2=A0 oe_runmake -C tests check-build<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_install_ptest() {<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tools<br>
&gt;&gt; +=C2=A0 =C2=A0 for file in $(find tests/* -executable -type f); d=
o<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 744 ${S}/${file} ${D}/${P=
TEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; +=C2=A0 =C2=A0 for file in $(find tests/*.tests -type f); do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 744 ${S}/${file} ${D}/${P=
TEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; +=C2=A0 =C2=A0 for file in $(find tools/* -executable -type f); d=
o<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 744 ${S}/${file} ${D}/${P=
TEST_PATH}/tools<br>
&gt;&gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +FILES_${PN} =3D &quot;${bindir} ${libdir}/${BPN}.so*&quot;<br>
&gt;&gt; +FILES_${PN}-dbg +=3D &quot;${libdir}/${PN}/tests/.debug/* ${libd=
ir}/${PN}/tools/.debug&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +RDEPENDS_${PN}-ptest =3D &quot;coreutils bash&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--000000000000a6984c05c0bb19d9--
