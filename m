Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.53840.1600726847663591739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 15:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cEEG9/Ln;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id l16so1926537ilt.13
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7N8bcxsPcQB+SAef8a3zVs2Vsm1F+MMA+SuCvijzNI=;
        b=cEEG9/LnOy+8/B0t0mNOx+4w+j3vSluONbRoSvdrU63HXe9PD+GbV6uAR4LSdW1QCE
         ctha5gEuFC4F0M/4yrle3syOCDpw8NSsysQUAF0mY4hv0NTrkpp0LaheJxUsIJDmxH0v
         tMNsSRK77+Hww8FrWO3l2OEWUIVNSNyWP3e3x6yzoJ0KQBNwPCbel+qI2aXoCldXSIiG
         QZRl3GxecfUsbF4ID+GHvF/tkLvYRMSYgsbt0qkxJ6jQC/AZT24U4B6/JkyFhLJ3xA3D
         lwy9OFaE4TvXJKBXHT3y7Y+dBu3Yx6/tIa7RtOIfeQK7HbGEbaKIIh6TpQxtkNCtCdoF
         80MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7N8bcxsPcQB+SAef8a3zVs2Vsm1F+MMA+SuCvijzNI=;
        b=jizMJa6DEl13+ADx29nLxLSJqq6XiWFRrGzN6UL7U9kjP0BSPBARqOhYqO9gV0BqLQ
         zDmvnoRfDgOVGKwczn9CICsgmvYD9wJylyP2NAdNMemioPlMqH0hPZNYB5q8WJMy9FL+
         RzNXJWTzRwrpiVr5zLRuOXECF3OIdkNaGCNnvvJbn0zXvXu7ARWNn/5mv+LzzOT7S0Wn
         Qz69pokGwf8SlbBMGZrlwkjmTi0kZFFW3th7oY8QDopCqe31vtcmkCIqxNQOoGvSwY9R
         +pN0nNEHqE5Ebcx0+3feAyS1cz7U5qTWLyCXzLSNSdOMaDsTuN9TADQeT4V5vY9CGnYz
         gdLQ==
X-Gm-Message-State: AOAM5320rCFd+H1hJgsC1nLycH5rlYpCJecqI42u+DEE55yc8epOlQL0
	ciWRov0ze5d6rP/D0IFTo0rHaU01lCUXZyu9Ods=
X-Google-Smtp-Source: ABdhPJwv2SOzabSimZ4+hZut8CaWlAbk8Kh98mPNx3Qo57wQxb6MOqvsy/MSsxyNiLfLeozIMdbSmaO6XlkGN3XI0Uc=
X-Received: by 2002:a92:d18c:: with SMTP id z12mr1874840ilz.142.1600726846971;
 Mon, 21 Sep 2020 15:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org> <20200921121204.2443466-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200921121204.2443466-2-richard.purdie@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Sep 2020 15:20:36 -0700
Message-ID: <CANx9H-AHvgNYgfhtiuYErfBtjqW=R4qr8NkNyiB7CCpNKgjJjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] python3-markupsafe: Import from meta-oe/meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018a70a05afda43fd"

--00000000000018a70a05afda43fd
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Needed as a dependency of python3-jinja2. ptest is disabled for OE-Core, at
> least for now since it depends on python3-pytest which in turn has may
> other
> dependencies.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>

> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-markupsafe/run-ptest       |  3 ++
>  .../python/python3-markupsafe_1.1.1.bb        | 28 +++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3-markupsafe/run-ptest
>  create mode 100644 meta/recipes-devtools/python/
> python3-markupsafe_1.1.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index a094b39b2af..84f473290ab 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -592,6 +592,7 @@ RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr
> Kravchuk <open.source@oleksan
>  RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <
> JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest
> b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
> new file mode 100644
> index 00000000000..5cec7116968
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> new file mode 100644
> index 00000000000..403a98a43f8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
> +HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> +
> +SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
> +SRC_URI[sha256sum] =
> "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
> +
> +PYPI_PACKAGE = "MarkupSafe"
> +inherit pypi setuptools3
> +# ptest disabled in OE-Core for now due to missing dependencies
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI += " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.25.1
>
>
> 
>
>

--00000000000018a70a05afda43fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 2020 at 5:12 AM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Needed=
 as a dependency of python3-jinja2. ptest is disabled for OE-Core, at<br>
least for now since it depends on python3-pytest which in turn has may oth=
er<br>
dependencies.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br></blockquote><div>Acked-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gm=
ail.com">ticotimo@gmail.com</a>&gt;</div><div>Signed-off-by: Tim Orling &lt=
;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
=C2=A0.../python/python3-markupsafe/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0.../python/<a href=3D"http://python3-markupsafe_1.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-markupsafe_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 | 28 +++++++++++++++++++<br>
=C2=A03 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-markupsafe/r=
un-ptest<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://py=
thon3-markupsafe_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mar=
kupsafe_1.1.1.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/i=
nclude/maintainers.inc<br>
index a094b39b2af..84f473290ab 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -592,6 +592,7 @@ RECIPE_MAINTAINER_pn-python3-iniparse =3D &quot;Oleksa=
ndr Kravchuk &lt;open.source@oleksan<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-libarchive-c =3D &quot;Joshua Watt &lt;=
<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-magic =3D &quot;Joshua Watt &lt;<a href=
=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-mako =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-python3-markupsafe =3D &quot;Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-nose =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-numpy =3D &quot;Oleksandr Kravchuk &lt;=
<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">ope=
n.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-pbr =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/m=
eta/recipes-devtools/python/python3-markupsafe/run-ptest<br>
new file mode 100644<br>
index 00000000000..5cec7116968<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-markup=
safe_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-markupsafe_1.1.=
1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-markupsaf=
e_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-markupsafe_1.1.1.b=
b</a><br>
new file mode 100644<br>
index 00000000000..403a98a43f8<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-markupsafe_1.=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-markupsafe_1.1.1.bb</a=
><br>
@@ -0,0 +1,28 @@<br>
+DESCRIPTION =3D &quot;Implements a XML/HTML/XHTML Markup safe string for =
Python&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://github.com/mitsuhiko/markupsafe" rel=
=
=3D"noreferrer" target=3D"_blank">http://github.com/mitsuhiko/markupsafe</=
a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Dffeffa59c90c9c4a033c7=
574f8f3fb75&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;43fd756864fe42063068e092e220c57b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;29872e92839765e546828bb7754a68c418d927cd064f=
d4708fab9fe9c8bb116b&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;MarkupSafe&quot;<br>
+inherit pypi setuptools3<br>
+# ptest disabled in OE-Core for now due to missing dependencies<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-stringold&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/<br=
>
+}<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000018a70a05afda43fd--
