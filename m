Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.36147.1606589826263345420
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 10:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLvF3x1M;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id f5so7501499ilj.9
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPl5voqyrmvylM3NS3GWF7722kKMChQkeOpYWMzyCvE=;
        b=lLvF3x1MbUnI+65kk1S8qTVnWrhFGeyXWmed2M0w6YKOYwr8F/phHQuJU8ag2DJ9+r
         b2xMPGoXTomydfgzKlzLkO6cUftjQQQWPfAZuAztkaKZ0Jyfztq3VtQoX5f66YmNP6Gp
         mlALoHYAgRwmn/XTFrSWtcIZ4WRpY5Hduolh/zCcr0TnIuhGDh6A93RoQxg217StDQmM
         ry3BcZclDF2uv/QTaml1LjtJ4t6tk9/AfCe4fjc6WuvNCGaDmqyfTr2D60sbDelxZ9PG
         5Y65TKitL95AA/ru71t4z/GCRCz8lbu2n794TwyiSEjYwVmT4EkU6OXrJKUwYcPJeSGZ
         DdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPl5voqyrmvylM3NS3GWF7722kKMChQkeOpYWMzyCvE=;
        b=BKxF44IeawOi2pFZ7rcjjPt05ZhQ3fF59Nlx9fRcnc5Z/mAfHHBy4e/19ddO9hbO4e
         AINJ2HY63W0viwlI3zYlDnqsOuPqa5sovB8BAR+wSN8lVYoR1TLKgVdfuS5Q12m/bpxW
         erNQobTP2Rogc5KzGjMk9GSCYOlMbtkdNHFoW0sGR/ZcMSvdl+NFPPbjLUU9y83Bef9w
         WPdW5GRsVnj3fIwAc6TTsBdiWYIbP+pFkgnA/8WCmFXESq6dM/o4gpUQzuVrOrYYbaK5
         jYt7h9lyv/T0FFkOVF2zRdOTYqB616yfCeDX6+iu7hPppt0L2j1sTBjfGoNLzdzB7DgT
         KgKg==
X-Gm-Message-State: AOAM533beRKo2iGGbB3QUmbTm2kG8JtNMUTwropPGGDyR32z5ybrdnid
	Xgja03ezTnEMxWZrYRYYHWDNKQaZF0rJXkoiVb8=
X-Google-Smtp-Source: ABdhPJznc6HKPs4+pqCY3OJP44enfRfdodsbrGiGinof0sb99vIs42CYx1RrIiwscBUqg1aTrpzlMdkB94YXBWnatf0=
X-Received: by 2002:a92:a00f:: with SMTP id e15mr11431596ili.122.1606589825551;
 Sat, 28 Nov 2020 10:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20201120172950.1619754-1-raj.khem@gmail.com> <20201120172950.1619754-4-raj.khem@gmail.com>
In-Reply-To: <20201120172950.1619754-4-raj.khem@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 28 Nov 2020 10:56:53 -0800
Message-ID: <CANx9H-AQbxr-RpJe3T-6YSR4=zMwmxwdrNCVGjAnLMpmo1fM2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/8] python-numpy: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da123605b52f577c"

--000000000000da123605b52f577c
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 9:30 AM Khem Raj <raj.khem@gmail.com> wrote:

> Since 1.15, numpy have replaced nose with pytest testing framework
> it additionally needs hypothesis and sortedcontainers modules
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
>  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest
>
> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest
> b/meta/recipes-devtools/python-numpy/files/run-ptest
> new file mode 100644
> index 0000000000..9a1c72aeb1
> --- /dev/null
> +++ b/meta/recipes-devtools/python-numpy/files/run-ptest
> @@ -0,0 +1,5 @@
> +#!/usr/bin/env python3
> +
> +import numpy
> +numpy.test(label='full', verbose=2)
> +
> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> index d54f2f6c18..b484e7cddc 100644
> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> +++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> @@ -8,6 +8,7 @@ SRCNAME = "numpy"
>  SRC_URI = "
> https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz
> \
>
> file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
>             file://0001-numpy-core-Define-RISCV-32-support.patch \
> +           file://run-ptest \
>  "
>  SRC_URI[sha256sum] =
> "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
>
> @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
>  DEPENDS += "python3-cython-native"
>
> -inherit setuptools3
> +inherit ptest setuptools3
>
>  S = "${WORKDIR}/numpy-${PV}"
>
> @@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-pprint \
>                    ${PYTHON_PN}-pickle \
>                    ${PYTHON_PN}-shell \
> -                  ${PYTHON_PN}-nose \
>                    ${PYTHON_PN}-doctest \
>                    ${PYTHON_PN}-datetime \
>                    ${PYTHON_PN}-distutils \
> @@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-netclient \__class__  = <class
> 'zipfile._ZipWriteFile'>
>         # and may, or may not, abort the process depending on the LAPACK
> package.
>
>         XERBLA_OK = 255
>
>         try:
>             pid = os.fork()
>         except (OSError, AttributeError):
>             # fork failed, or not running on POSIX
>             pytest.skip("Not POSIX or fork failed.")
>
>         if pid == 0:
>             # child; close i/o file handles
>             os.close(1)
>             os.close(0)
>             # Avoid producing core files.
> >           import resource
> E           ModuleNotFoundError: No module named 'resource'
>
> XERBLA_OK  = 255
> pid        = 0
>
> ../../python3.9/site-packages/numpy/linalg/tests/test_linalg.py:1808:
> ModuleNotFoundError
>
> """



>                    ${PYTHON_PN}-numbers \
>                    ${PYTHON_PN}-pydoc \
> +                  ${PYTHON_PN}-pytest \
> +                  ${PYTHON_PN}-hypothesis \
> +                  ${PYTHON_PN}-sortedcontainers \
>

Also needs ${PYTHON_PN}-resource

"""

                   ${PYTHON_PN}-pkgutil \
>                    ${PYTHON_PN}-email \
>                    ${PYTHON_PN}-compression \
> --
> 2.29.2
>
>
> 
>
>

--000000000000da123605b52f577c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 9:30 AM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since 1.15,=
 numpy have replaced nose with pytest testing framework<br>
it additionally needs hypothesis and sortedcontainers modules<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python-numpy/files/run-ptest=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta/recipes-devtools/python-numpy/<a href=3D"http://python3-numpy_1=
.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.4.bb</a> =
| 7 +++++--<br>
=C2=A02 files changed, 10 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptes=
t<br>
<br>
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/rec=
ipes-devtools/python-numpy/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..9a1c72aeb1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python-numpy/files/run-ptest<br>
@@ -0,0 +1,5 @@<br>
+#!/usr/bin/env python3<br>
+<br>
+import numpy<br>
+numpy.test(label=3D&#39;full&#39;, verbose=3D2)<br>
+<br>
diff --git a/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-=
numpy_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.4.=
bb</a> b/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-numpy=
_1.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.4.bb</a=
><br>
index d54f2f6c18..b484e7cddc 100644<br>
--- a/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-numpy_1=
.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.4.bb</a><=
br>
+++ b/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-numpy_1=
.19.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.19.4.bb</a><=
br>
@@ -8,6 +8,7 @@ SRCNAME =3D &quot;numpy&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BSRCNAME%7D/$%7BS=
RCNAME%7D/releases/download/v$%7BPV%7D/$%7BSRCNAME%7D-$%7BPV%7D.tar.gz" rel=
=
=3D"noreferrer" target=3D"_blank">https://github.com/${SRCNAME}/${SRCNAME}=
/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-search-usr-and=
-so-on-for-libraries-by-default-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-numpy-core-Define-RI=
SCV-32-support.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fe836a685d6838dbb3f603caef01183ea98e88f=
ebf4ce956a2ea484a75378413&quot;<br>
<br>
@@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)=
+)\.tar&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-cython-native&quot;<br>
<br>
-inherit setuptools3<br>
+inherit ptest setuptools3<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/numpy-${PV}&quot;<br>
<br>
@@ -30,7 +31,6 @@ RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-unittest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-pprint \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-pickle \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-shell \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_P=
N}-nose \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-doctest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-datetime \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-distutils \<br>
@@ -39,6 +39,9 @@ RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-unittest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-netclient \__class__ =C2=A0=3D &lt;class &#39;zipfile._ZipWriteFile=
&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and may, or may not, abort the p=
rocess depending on the LAPACK package.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
XERBLA_OK =3D 255<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid =3D os.fork()<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 except (OSError, AttributeError):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # fork failed, or not running on POSIX<br>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 pytest.skip(&quot;Not POSIX or fork failed.&quot;)<br=
><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pid =3D=3D 0:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # child; close i/o file handles<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 os.close(1)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 os.close(0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Avoid pr=
oducing core files.<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import resou=
rce<br>E =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ModuleNotFoundError: No module =
named &#39;resource&#39;<br><br>XERBLA_OK =C2=A0=3D 255<br>pid =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0<br><br>../../python3.9/site-packages/numpy/linalg/t=
ests/test_linalg.py:1808: ModuleNotFoundError<br><br>&quot;&quot;&quot;</bl=
ockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ${PYT=
HON_PN}-numbers \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-pydoc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_P=
N}-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_P=
N}-hypothesis \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_P=
N}-sortedcontainers \<br></blockquote><div><br></div><div>Also needs ${PYTH=
ON_PN}-resource <br></div><div><br></div><div>&quot;&quot;&quot;</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-pkgutil \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-email \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYT=
HON_PN}-compression \<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000da123605b52f577c--
