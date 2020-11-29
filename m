Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web08.40073.1606610806739733749
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 16:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JM46rTEG;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id p5so7922271iln.8
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 16:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/E2mMfUcFSapbWaWFK4HgcCTfvg3QvYdwxE+mtvj0ok=;
        b=JM46rTEGrD0l2BCDRIGS0nO9Lv7QVwtx9rCmJtYXfaos+BfyAJiXY3yBJzDHajuzis
         RSSjCbLPwpMBpFdgErgzrQzNg07n33xZQvZQBXKcYsyzKmoDxljiOx8cNq+lh8cYgLEx
         blhaykWZPrEiqxKYy5CF9rFQsHQsXWa1zblcR5OQAPahtsYsBN68di90S2Y6l4NiV17f
         EIgyCHa+km/80mYD6xrh5mJm6nLvMKFnVKKwRq547rnIrt42bb9Nl+5Gn/ompoKw/uhO
         VEhID7V/xrldNSsufd+eP+ep8jBRotCkFauoyovxL022CgiC+2lKbMentBVmbBPBpdm4
         q5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/E2mMfUcFSapbWaWFK4HgcCTfvg3QvYdwxE+mtvj0ok=;
        b=rWE7en67OTlHyLsZyZjU7tNxo3htHvvqLspc/4Ax1ZojmZIYDwgTy97EZDlP4nUcaC
         83m+4l9nDjrrwEYXEkOsjLuzP9JZ+dEYlxsGHtnlZWtSZmrMPlR/btKgrEZppSCqIXb4
         8hPoEzM8jbcFRcDN2cfxN6brEj3g8YVAPiUwVw/i5eWPxZ0i9ce4TZzbONPogvfrX33D
         eAefWs2GX/8MLL0ZR/4FlRkZIUY2GcB56FIPDtshVUOkq/eBOGuQ+3MmNUrHkHhoC8Bp
         DE1tqbgjuNjpawWS0g9xJuQpwbKN7i+XstN6v1f9qMykA2fpeag3f0muDSlhVRPtTqKb
         BQig==
X-Gm-Message-State: AOAM5311vuq542SD8MKVYfgKIVhfma3IWbWfB6RT/cPGVGfcp97oUZ/i
	IESAglOeEuhLT4ku6uSMmIOMB5xocKmFRfKfa+s=
X-Google-Smtp-Source: ABdhPJyRneJRUK6L/pQ4ukY9y4utsSIbzrpXt7NKTlUUXmlGgMHpv7IU8WpNzYz+HHnP/YCqwbSpaYtwvaRETH93BuE=
X-Received: by 2002:a92:1f19:: with SMTP id i25mr13169875ile.198.1606610806002;
 Sat, 28 Nov 2020 16:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20201120172950.1619754-1-raj.khem@gmail.com> <20201120172950.1619754-4-raj.khem@gmail.com>
 <CANx9H-AQbxr-RpJe3T-6YSR4=zMwmxwdrNCVGjAnLMpmo1fM2w@mail.gmail.com> <CAMKF1soTReBQ6qVMgJMU1F6O9QdLQ2AMLShXw91u3+GY5k-H+A@mail.gmail.com>
In-Reply-To: <CAMKF1soTReBQ6qVMgJMU1F6O9QdLQ2AMLShXw91u3+GY5k-H+A@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 28 Nov 2020 16:46:35 -0800
Message-ID: <CANx9H-D1czxDik=AYuuK7mJppLZStMekWO_VxcqdF5ec-qGpVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/8] python-numpy: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000062596505b5343a12"

--00000000000062596505b5343a12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s just
=E2=80=9Cimport resource=E2=80=9D
It=E2=80=99s a sub-package of python3 itself
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools=
/python/python3/python3-manifest.json#n1024


On Sat, Nov 28, 2020 at 1:03 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Nov 28, 2020 at 10:57 AM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Fri, Nov 20, 2020 at 9:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Since 1.15, numpy have replaced nose with pytest testing framework
> >> it additionally needs hypothesis and sortedcontainers modules
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
> >>  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++=
--
> >>  2 files changed, 10 insertions(+), 2 deletions(-)
> >>  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptes=
t
> >>
> >> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest
> b/meta/recipes-devtools/python-numpy/files/run-ptest
> >> new file mode 100644
> >> index 0000000000..9a1c72aeb1
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python-numpy/files/run-ptest
> >> @@ -0,0 +1,5 @@
> >> +#!/usr/bin/env python3
> >> +
> >> +import numpy
> >> +numpy.test(label=3D'full', verbose=3D2)
> >> +
> >> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.=
bb
> b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> >> index d54f2f6c18..b484e7cddc 100644
> >> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> >> +++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> >> @@ -8,6 +8,7 @@ SRCNAME =3D "numpy"
> >>  SRC_URI =3D "
> https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCN=
AME}-${PV}.tar.gz
> \
> >>
>  file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch =
\
> >>             file://0001-numpy-core-Define-RISCV-32-support.patch \
> >> +           file://run-ptest \
> >>  "
> >>  SRC_URI[sha256sum] =3D
> "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
> >>
> >> @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.ta=
r"
> >>
> >>  DEPENDS +=3D "python3-cython-native"
> >>
> >> -inherit setuptools3
> >> +inherit ptest setuptools3
> >>
> >>  S =3D "${WORKDIR}/numpy-${PV}"
> >>
> >> @@ -30,7 +31,6 @@ RDEPENDS_${PN} =3D "${PYTHON_PN}-unittest \
> >>                    ${PYTHON_PN}-pprint \
> >>                    ${PYTHON_PN}-pickle \
> >>                    ${PYTHON_PN}-shell \
> >> -                  ${PYTHON_PN}-nose \
> >>                    ${PYTHON_PN}-doctest \
> >>                    ${PYTHON_PN}-datetime \
> >>                    ${PYTHON_PN}-distutils \
> >> @@ -39,6 +39,9 @@ RDEPENDS_${PN} =3D "${PYTHON_PN}-unittest \
> >>                    ${PYTHON_PN}-netclient \__class__  =3D <class
> 'zipfile._ZipWriteFile'>
> >>         # and may, or may not, abort the process depending on the
> LAPACK package.
> >>
> >>         XERBLA_OK =3D 255
> >>
> >>         try:
> >>             pid =3D os.fork()
> >>         except (OSError, AttributeError):
> >>             # fork failed, or not running on POSIX
> >>             pytest.skip("Not POSIX or fork failed.")
> >>
> >>         if pid =3D=3D 0:
> >>             # child; close i/o file handles
> >>             os.close(1)
> >>             os.close(0)
> >>             # Avoid producing core files.
> >> >           import resource
> >> E           ModuleNotFoundError: No module named 'resource'
> >>
> >> XERBLA_OK  =3D 255
> >> pid        =3D 0
> >>
> >> ../../python3.9/site-packages/numpy/linalg/tests/test_linalg.py:1808:
> ModuleNotFoundError
> >>
> >> """
> >
> >
> >>
> >>                    ${PYTHON_PN}-numbers \
> >>                    ${PYTHON_PN}-pydoc \
> >> +                  ${PYTHON_PN}-pytest \
> >> +                  ${PYTHON_PN}-hypothesis \
> >> +                  ${PYTHON_PN}-sortedcontainers \
> >
> >
> > Also needs ${PYTHON_PN}-resource
> >
>
> Thanks, did you mean python3-pkg-resources ?
> I did not encounter this locally and I have the above installed and
> was wondering if thats the case.
> but I have added this, I will send that in v4 otherwise.
>
> > """
> >
> >>                    ${PYTHON_PN}-pkgutil \
> >>                    ${PYTHON_PN}-email \
> >>                    ${PYTHON_PN}-compression \
> >> --
> >> 2.29.2
> >>
> >>
> >>=20
> >>
>

--00000000000062596505b5343a12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s just</div><div dir=3D"auto">=E2=80=9Cimport =
resource=E2=80=9D</div><div dir=3D"auto">It=E2=80=99s a sub-package of pyth=
on3 itself</div><div dir=3D"auto"><div><a href=3D"https://git.yoctoproject.=
org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-ma=
nifest.json#n1024">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/met=
a/recipes-devtools/python/python3/python3-manifest.json#n1024</a></div><br>=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Nov 28, 2020 at 1:03 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>On Sat, Nov 28, 2020 at 10:57 AM Tim Orling &lt;<a href=3D"mailto:ticotimo=
@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Nov 20, 2020 at 9:30 AM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Since 1.15, numpy have replaced nose with pytest testing framewor=
k<br>
&gt;&gt; it additionally needs hypothesis and sortedcontainers modules<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/python-numpy/files/run-ptest=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/python-numpy/<a href=3D"http://python=
3-numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.=
4.bb</a> | 7 +++++--<br>
&gt;&gt;=C2=A0 2 files changed, 10 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python-numpy/files=
/run-ptest<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b=
/meta/recipes-devtools/python-numpy/files/run-ptest<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..9a1c72aeb1<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/python-numpy/files/run-ptest<br>
&gt;&gt; @@ -0,0 +1,5 @@<br>
&gt;&gt; +#!/usr/bin/env python3<br>
&gt;&gt; +<br>
&gt;&gt; +import numpy<br>
&gt;&gt; +numpy.test(label=3D&#39;full&#39;, verbose=3D2)<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python-numpy/<a href=3D"http:/=
/python3-numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-nump=
y_1.19.4.bb</a> b/meta/recipes-devtools/python-numpy/<a href=3D"http://pyth=
on3-numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.1=
9.4.bb</a><br>
&gt;&gt; index d54f2f6c18..b484e7cddc 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python-numpy/<a href=3D"http://python=
3-numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.=
4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/python-numpy/<a href=3D"http://python=
3-numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.=
4.bb</a><br>
&gt;&gt; @@ -8,6 +8,7 @@ SRCNAME =3D &quot;numpy&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BSRCNAME=
%7D/$%7BSRCNAME%7D/releases/download/v$%7BPV%7D/$%7BSRCNAME%7D-$%7BPV%7D.ta=
r.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/${SRCNAME}/${=
SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Don-t-=
search-usr-and-so-on-for-libraries-by-default-.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-numpy-=
core-Define-RISCV-32-support.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;fe836a685d6838dbb3f603caef0118=
3ea98e88febf4ce956a2ea484a75378413&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\=
d+(\.\d+)+)\.tar&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS +=3D &quot;python3-cython-native&quot;<br>
&gt;&gt;<br>
&gt;&gt; -inherit setuptools3<br>
&gt;&gt; +inherit ptest setuptools3<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/numpy-${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -30,7 +31,6 @@ RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-unittest =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-pprint \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-pickle \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-shell \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{PYTHON_PN}-nose \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-doctest \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-datetime \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-distutils \<br>
&gt;&gt; @@ -39,6 +39,9 @@ RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-unittest =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-netclient \__class__=C2=A0 =3D &lt;class &#39;zipfile._Zi=
pWriteFile&#39;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and may, or may not, abort the=
 process depending on the LAPACK package.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XERBLA_OK =3D 255<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D os.fork()<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except (OSError, AttributeError)=
:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# fork failed, or =
not running on POSIX<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pytest.skip(&quot;=
Not POSIX or fork failed.&quot;)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pid =3D=3D 0:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# child; close i/o=
 file handles<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.close(1)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.close(0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Avoid producing =
core files.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import resource<br>
&gt;&gt; E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ModuleNotFoundError: No=
 module named &#39;resource&#39;<br>
&gt;&gt;<br>
&gt;&gt; XERBLA_OK=C2=A0 =3D 255<br>
&gt;&gt; pid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0<br>
&gt;&gt;<br>
&gt;&gt; ../../python3.9/site-packages/numpy/linalg/tests/test_linalg.py:1=
808: ModuleNotFoundError<br>
&gt;&gt;<br>
&gt;&gt; &quot;&quot;&quot;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-numbers \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-pydoc \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{PYTHON_PN}-pytest \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{PYTHON_PN}-hypothesis \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{PYTHON_PN}-sortedcontainers \<br>
&gt;<br>
&gt;<br>
&gt; Also needs ${PYTHON_PN}-resource<br>
&gt;<br>
<br>
Thanks, did you mean python3-pkg-resources ?<br>
I did not encounter this locally and I have the above installed and<br>
was wondering if thats the case.<br>
but I have added this, I will send that in v4 otherwise.<br>
<br>
&gt; &quot;&quot;&quot;<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-pkgutil \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-email \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${PYTHON_PN}-compression \<br>
&gt;&gt; --<br>
&gt;&gt; 2.29.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000062596505b5343a12--
