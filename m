Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.53692.1600726884015690584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 15:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EbRqDZNt;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id f82so15355036ilh.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 15:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CqtRRssp6KSxlpxjn1TsUJXIPUFQXObo0AUh4o5wM+Y=;
        b=EbRqDZNtrjfEmwJiIaLnCrlqHMCQPH7wgLQJ3OLwyaJato6W76W1MIVSlw1EZOovw6
         U+ZXqnVIVxx5iCHybVA4yo8XOohkH7mdxnezuioLwzE+hsuZJT+IC/tKaGSbXrHkQK8D
         qSj++2gJzEbcVJYPWqVsE3i6AboojBereNN8fyTgmS/LI/YkKvkNK2jm+5URNrD8XT4I
         vQt/moHZ56dyi90Gg2zG3YpVuOUvSwrof4K4D84x1mDMyrmokZ+AyWaLsYMt36gXAmbn
         OZCvdwTTRttuj6orZe4W2nhkht8uFVNFXfrn9dxA3HI8PQyA+t9FLMyQASyBTe/YKfhY
         1OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CqtRRssp6KSxlpxjn1TsUJXIPUFQXObo0AUh4o5wM+Y=;
        b=nEc1lN49WG454XVpgt5hAssh3J/ogspovE+9RejUFd9sszXdt/QUXXkCtFObASRlVa
         aqkhd0Q7FnZpQC7dndxSu7yPPCF3RuioSRC+nXLylcd254ZA7APw3hEI18HY+o26nJey
         MhieWf1r5YspVudax5gE6Npdj86IsKyHbZmgJGxVfU+7/Soym/E0DiBW9dVEJv2DMKvj
         RMbPpfoXCTJ9CvNmiYmsPldx0CB2sAorwDBE7Skd7eWIIOl2hM2woHJNXOMXcZ93vba4
         R7sK2nUJK6aQuDlxJ7rVAd1xuvfcQl7pv6ZyMoGwkUIJReUvjq7ju7LM/lZ7Tpy0UhlR
         eR2g==
X-Gm-Message-State: AOAM532v0HrRuKNe7uUVvSyEvqpqL48lujKIsvTUesBhG/E0Vy72c1hB
	zk0gHpcDcgXjYyHj+cArhBbEQCeRWbYNIJCwDjtoIuG6ItI=
X-Google-Smtp-Source: ABdhPJwwtH9Px9sN3eF31rW3s8kJa6EYAWCMXvMB/03KQ7is/9iysMKtMAzBp4XdgD+PborrdDWxYJ2pyKzEZxe3QMI=
X-Received: by 2002:a92:c882:: with SMTP id w2mr1753598ilo.151.1600726883278;
 Mon, 21 Sep 2020 15:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org> <20200921121204.2443466-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200921121204.2443466-3-richard.purdie@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Sep 2020 15:21:12 -0700
Message-ID: <CANx9H-AtmRz5Xf55v1UaS3rKn91P5zrfMkBZRABFs5seLRSupQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-jinja2: Import from meta-oe/meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042a57705afda4536"

--00000000000042a57705afda4536
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This is used by some of the results handling code and needed as part of
> buildtools tarball on various autobuilder worker for testing.
>
> ptest is disabled for OE-Core, at least for now since it depends on
> python3-pytest which in turn has may other dependencies.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>

> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-jinja2/run-ptest           |  3 ++
>  .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 84f473290ab..d349382cb9d 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -589,6 +589,7 @@ RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr
> Kravchuk <open.source@oleksandr
>  RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <
> JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest
> b/meta/recipes-devtools/python/python3-jinja2/run-ptest
> new file mode 100644
> index 00000000000..5cec7116968
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
> b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
> new file mode 100644
> index 00000000000..89538d2f272
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "Python Jinja2: A small but fast and easy to use
> stand-alone template engine written in pure python."
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
> +
> +SRC_URI[sha256sum] =
> "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
> +
> +PYPI_PACKAGE = "Jinja2"
> +
> +CLEANBROKEN = "1"
> +
> +inherit pypi setuptools3
> +# ptest disabled in OE-Core for now due to missing dependencies
> +
> +
> +SRC_URI += " \
> +       file://run-ptest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +       ${PYTHON_PN}-unixadmin \
> +"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-asyncio \
> +    ${PYTHON_PN}-crypt \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-markupsafe \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-numbers\
> +    ${PYTHON_PN}-pickle \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-threading \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> 
>
>

--00000000000042a57705afda4536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 202=
0 at 5:12 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex">This is used by some of the results handling code and needed as=
 part of<br>
buildtools tarball on various autobuilder worker for testing.<br>
<br>
ptest is disabled for OE-Core, at least for now since it depends on<br>
python3-pytest which in turn has may other dependencies.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br></blockquote><div style=3D"color:rgb(0,0,0)">Acked-by: Tim Orling &lt;<a=
 href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;</div><div><s=
pan style=3D"color:rgb(0,0,0)">Signed-off-by: Tim Orling &lt;<a href=3D"mai=
lto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;=C2=A0</span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
=C2=A0.../python/python3-jinja2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0.../python/<a href=3D"http://python3-jinja2_2.11.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-jinja2_2.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 45 +++++++++++++++++++<br>
=C2=A03 files changed, 49 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-p=
test<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://py=
thon3-jinja2_2.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2=
_2.11.2.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/i=
nclude/maintainers.inc<br>
index 84f473290ab..d349382cb9d 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -589,6 +589,7 @@ RECIPE_MAINTAINER_pn-python3-extras =3D &quot;Oleksand=
r Kravchuk &lt;open.source@oleksandr<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-git =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-gitdb =3D &quot;Oleksandr Kravchuk &lt;=
<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">ope=
n.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-iniparse =3D &quot;Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">=
open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-python3-jinja2 =3D &quot;Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;&quot;<br>
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
diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/=
recipes-devtools/python/python3-jinja2/run-ptest<br>
new file mode 100644<br>
index 00000000000..5cec7116968<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2=
_2.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_2.11.2.bb</=
a> b/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_2.11.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_2.11.2.bb</a><br>
new file mode 100644<br>
index 00000000000..89538d2f272<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_2.11.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-jinja2_2.11.2.bb</a><br>
@@ -0,0 +1,45 @@<br>
+DESCRIPTION =3D &quot;Python Jinja2: A small but fast and easy to use sta=
nd-alone template engine written in pure python.&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9=
827a5229462&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;89aab215427ef59c34ad58735269eb58b1a580810306=
7f7bb9d5836c651b3bb0&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;Jinja2&quot;<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+# ptest disabled in OE-Core for now due to missing dependencies<br>
+<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+}<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-unixadmin \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-asyncio \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-crypt \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-json \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-markupsafe \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-math \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-netclient \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-numbers\<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pickle \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pprint \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-shell \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000042a57705afda4536--
