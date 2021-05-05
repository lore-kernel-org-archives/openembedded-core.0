Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.1405.1620241419514639672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=goTcnweD;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id x9so912059uao.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U3Pso7QYYoPaOb8H7CkmGZfyD00gLnPWBBtwxBfshIE=;
        b=goTcnweDsn90yyDF6xdjPo2RZRK9mzYSvvitIBO+IgFWFgPCJNFX8XHxF2A3EOW1sP
         PSF8Qub9qG+nvH1fJe+8kiDas3Ib/8n4/PYda5g6kCvygsCy93JFivTYVUFLkvW3eVRr
         O4Fknkl1zs2U+FonQENkQ+2IIlXw8NNabLVWX8iwpLSrqyA+Wk3WxWcd2hY5gGsd7yEm
         qxl0fT3wpcH9Rq4ConGw92CN1Z0ywz/wypM/i4hg7zwJulKHje9xqQyJkYU3LOwcg6mT
         dQS1MpuxT8PixDMgB9Zo6Bl/MzKovtdxvuVHkzfrtVfxwkxH6t/n0eBNkJiqecds3x1Q
         o5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U3Pso7QYYoPaOb8H7CkmGZfyD00gLnPWBBtwxBfshIE=;
        b=PVVbb/pMAP3JO4NcKIzODII0bpv/inkVEl+zYr5sQVT5qNqgUniBk/ic766n8Xyg9M
         EAmshUfWRk6nvXlDke2Uzkf6ENloZFAjrVEhuk9tcrbl2Z0IpW6xwDskIavTdYQpAn+X
         eMCsusZPaSjmEMtTe1RgmV4tr/xbo76crsPvLsk7GniNN3FE09QtDh5XiDxQp8xZ+oUV
         JYdh67A4WjoMCXUW+tD+TE54ptH0L6seJHT1U+6ualRrAQh+35EBk2W5okK7wOI5YeVq
         OcW7I2Q5ZpJRS+1DZyQlhT3cuDMN9XdcOyiHU42MJuzqQMJSG7D1QwcZVLbW27Za/Sqi
         npFw==
X-Gm-Message-State: AOAM533Zzl1kzv2vhm49AGwZLNaWXozlRZcomL3s4MF0GCOKafXuUANm
	OxNHMPJXHE8t8oL/5tSKB4iOIPkD2ocul0wVJaI=
X-Google-Smtp-Source: ABdhPJyHV3HkCumbOWe/SN/GEgMlV0F8X8m7VFXynq7XJ8QZf3LgIt5u8y0wIkrKGvimmoQI0VGWGymQXVR4s8wPxA0=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr671885uar.100.1620241418644;
 Wed, 05 May 2021 12:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com> <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
In-Reply-To: <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 21:03:27 +0200
Message-ID: <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Khem Raj <raj.khem@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000356f2a05c199da7f"

--000000000000356f2a05c199da7f
Content-Type: text/plain; charset="UTF-8"

The repo is here:
https://github.com/leohemsted/smartypants.py

I opened an issue:
https://github.com/mintchaos/typogrify/issues/56

gi-docgen doesn't depend on it directly, but rather through typogrify.

Alex

On Wed, 5 May 2021 at 19:51, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 5, 2021 at 8:39 AM Konrad Weihmann <kweihmann@outlook.com>
> wrote:
> >
> >
> >
> > On 05.05.21 17:18, Alexander Kanavin wrote:
> > > This is needed to enable gi-docgen, a successor to gtk-doc
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >   meta/conf/distro/include/maintainers.inc           |  3 +++
> > >   .../python/python3-markdown_3.3.3.bb               | 14
> ++++++++++++++
> > >   .../python/python3-smartypants_2.0.0.bb            | 12 ++++++++++++
> > >   .../python/python3-typogrify_2.0.7.bb              | 14
> ++++++++++++++
> > >   4 files changed, 43 insertions(+)
> > >   create mode 100644 meta/recipes-devtools/python/
> python3-markdown_3.3.3.bb
> > >   create mode 100644 meta/recipes-devtools/python/
> python3-smartypants_2.0.0.bb
> > >   create mode 100644 meta/recipes-devtools/python/
> python3-typogrify_2.0.7.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > > index 140f7b490e..0c3e3628ba 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard
> Purdie <richard.purdie@linuxfound
> > >   RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <
> JPEWhacker@gmail.com>"
> > >   RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <
> JPEWhacker@gmail.com>"
> > >   RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > > +RECIPE_MAINTAINER_pn-python3-markdown = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > >   RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> > >   RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > >   RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > > @@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native = "Tim
> Orling <timothy.t.orling@linux.
> > >   RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > >   RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > >   RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <
> zangrc.fnst@fujitsu.com>"
> > > +RECIPE_MAINTAINER_pn-python3-smartypants = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > >   RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > >   RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > >   RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > >   RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > >   RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > > +RECIPE_MAINTAINER_pn-python3-typogrify = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > >   RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > >   RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > >   RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> > > diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> > > new file mode 100644
> > > index 0000000000..c456f05541
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> > > @@ -0,0 +1,14 @@
> > > +SUMMARY = "A Python implementation of John Gruber's Markdown."
> > > +HOMEPAGE = "https://python-markdown.github.io/"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
> > > +
> > > +inherit pypi setuptools3
> > > +
> > > +PYPI_PACKAGE = "Markdown"
> > > +SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
> > > +SRC_URI[sha256sum] =
> "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
> > > +
> > > +BBCLASSEXTEND = "native"
> > > +
> > > +RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
> > > diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> > > new file mode 100644
> > > index 0000000000..8acc971c35
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> >
> > According to pypi this isn't the latest version, but 2.0.1 isn't
> > available as sources - also this project is unmaintained and the repo
> > isn't even available anymore - what's the process for these kind of
> recipes?
> >
>
> looking at the URL https://pythonhosted.org/smartypants/
>
>  As of 2016-12-28, smartypants is looking for new maintainer to take
> over, please contact project owner on Bitbucket.
>
> yeah we should not add unmaintained new recipe additions for dead
> packages to at least oe-core
> if gi-docgen, is next-gen for gtk-doc then report it upstream that
> they have such a dependency and whats their plan
> because next-gen tells me that they might looking into future
>
> > > @@ -0,0 +1,12 @@
> > > +SUMMARY = "Translator of plain ASCII punctuation characters into
> 'smart' typographic punctuation HTML entities"
> > > +HOMEPAGE = "https://pythonhosted.org/smartypants/"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
> > > +
> > > +inherit pypi setuptools3
> > > +
> > > +PYPI_PACKAGE = "smartypants"
> > > +SRC_URI[sha256sum] =
> "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
> > > +
> > > +BBCLASSEXTEND = "native"
> > > +
> > > diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> > > new file mode 100644
> > > index 0000000000..3becb0dd8d
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> > > @@ -0,0 +1,14 @@
> > > +SUMMARY = "Filters to enhance web typography, including support for
> Django & Jinja templates"
> > > +HOMEPAGE = "https://github.com/mintchaos/typogrify"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=12bc792d6f5415dbf421f3fd183c6dd2"
> > > +
> > > +inherit pypi setuptools3
> > > +
> > > +PYPI_PACKAGE = "typogrify"
> > > +SRC_URI[sha256sum] =
> "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
> > > +
> > > +BBCLASSEXTEND = "native"
> > > +
> > > +RDEPENDS_${PN} += "${PYTHON_PN}-smartypants"
> > > +
> > >
> > >
> > >
> > >
> > >
> >
> > 
> >
>

--000000000000356f2a05c199da7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The repo is here:</div><div><a href=3D"https://github=
.com/leohemsted/smartypants.py">https://github.com/leohemsted/smartypants.p=
y</a></div><div><br></div><div>I opened an issue:</div><div><a href=3D"http=
s://github.com/mintchaos/typogrify/issues/56">https://github.com/mintchaos/=
typogrify/issues/56</a></div><div><br></div><div>gi-docgen doesn&#39;t depe=
nd on it directly, but rather through typogrify.</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, 5 May 2021 at 19:51, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, May 5, 2021 at 8:39 AM Konrad W=
eihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kwei=
hmann@outlook.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 05.05.21 17:18, Alexander Kanavin wrote:<br>
&gt; &gt; This is needed to enable gi-docgen, a successor to gtk-doc<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt; &gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-markdown_3.3.3.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-markdown_3.3.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br=
>
&gt; &gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-smartypants_2.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smartypants_2.0.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-typogrify_2.0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-typogrify_2.0.7.bb</a>=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 43 insertions(+)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a h=
ref=3D"http://python3-markdown_3.3.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-markdown_3.3.3.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a h=
ref=3D"http://python3-smartypants_2.0.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-smartypants_2.0.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a h=
ref=3D"http://python3-typogrify_2.0.7.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-typogrify_2.0.7.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/con=
f/distro/include/maintainers.inc<br>
&gt; &gt; index 140f7b490e..0c3e3628ba 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; @@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 =3D &quo=
t;Richard Purdie &lt;richard.purdie@linuxfound<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-libarchive-c =3D &quot;=
Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">J=
PEWhacker@gmail.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-magic =3D &quot;Joshua =
Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhack=
er@gmail.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-mako =3D &quot;Oleksand=
r Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=
=
=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt; +RECIPE_MAINTAINER_pn-python3-markdown =3D &quot;Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-markupsafe =3D &quot;Ri=
chard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-more-itertools =3D &quo=
t;Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=
=
=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-nose =3D &quot;Oleksand=
r Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=
=
=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt; @@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native =
=
=3D &quot;Tim Orling &lt;timothy.t.orling@linux.<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-setuptools =3D &quot;Ol=
eksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" =
target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-setuptools-scm =3D &quo=
t;Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=
=
=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-six =3D &quot;Zang Ruoc=
hen &lt;<a href=3D"mailto:zangrc.fnst@fujitsu.com" target=3D"_blank">zangrc=
.fnst@fujitsu.com</a>&gt;&quot;<br>
&gt; &gt; +RECIPE_MAINTAINER_pn-python3-smartypants =3D &quot;Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-smmap =3D &quot;Oleksan=
dr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" targe=
t=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-sortedcontainers =3D &q=
uot;Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" targ=
et=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-subunit =3D &quot;Oleks=
andr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" tar=
get=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-testtools =3D &quot;Ole=
ksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" t=
arget=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-toml =3D &quot;Tim Orli=
ng &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank=
">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt; +RECIPE_MAINTAINER_pn-python3-typogrify =3D &quot;Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-wcwidth =3D &quot;Tim O=
rling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_bl=
ank">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-python3-zipp =3D &quot;Tim Orli=
ng &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank=
">timothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-qemu =3D &quot;Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-markdown_3.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-markdow=
n_3.3.3.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-mar=
kdown_3.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-markdown_3.3.3=
.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..c456f05541<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-mar=
kdown_3.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-markdown_3.3.3=
.bb</a><br>
&gt; &gt; @@ -0,0 +1,14 @@<br>
&gt; &gt; +SUMMARY =3D &quot;A Python implementation of John Gruber&#39;s =
Markdown.&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://python-markdown.github.io=
/" rel=3D"noreferrer" target=3D"_blank">https://python-markdown.github.io/<=
/a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D745aaad0c69c=
60039e638bff9ffc59ed&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pypi setuptools3<br>
&gt; &gt; +<br>
&gt; &gt; +PYPI_PACKAGE =3D &quot;Markdown&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;034e3bccfde211d44b4a7a69cb290ba0&quot=
;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;5d9f2b5ca24bc4c7a390d22323ca4bad20=
0368612b5aaa7796babf971d2b2f18&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-logging ${PYTHON_PN}-set=
uptools&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-smartypants_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smar=
typants_2.0.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://pytho=
n3-smartypants_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smart=
ypants_2.0.0.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..8acc971c35<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-sma=
rtypants_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smartypants=
_2.0.0.bb</a><br>
&gt;<br>
&gt; According to pypi this isn&#39;t the latest version, but 2.0.1 isn&#3=
9;t<br>
&gt; available as sources - also this project is unmaintained and the repo=
<br>
&gt; isn&#39;t even available anymore - what&#39;s the process for these k=
ind of recipes?<br>
&gt;<br>
<br>
looking at the URL <a href=3D"https://pythonhosted.org/smartypants/" rel=
=3D"noreferrer" target=3D"_blank">https://pythonhosted.org/smartypants/</a=
><br>
<br>
=C2=A0As of 2016-12-28, smartypants is looking for new maintainer to take<=
br>
over, please contact project owner on Bitbucket.<br>
<br>
yeah we should not add unmaintained new recipe additions for dead<br>
packages to at least oe-core<br>
if gi-docgen, is next-gen for gtk-doc then report it upstream that<br>
they have such a dependency and whats their plan<br>
because next-gen tells me that they might looking into future<br>
<br>
&gt; &gt; @@ -0,0 +1,12 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Translator of plain ASCII punctuation charact=
ers into &#39;smart&#39; typographic punctuation HTML entities&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://pythonhosted.org/smartypa=
nts/" rel=3D"noreferrer" target=3D"_blank">https://pythonhosted.org/smartyp=
ants/</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D977036977591ac6=
66c728921ecc54c4f&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pypi setuptools3<br>
&gt; &gt; +<br>
&gt; &gt; +PYPI_PACKAGE =3D &quot;smartypants&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;7812353a32022699a1aa8cd5626e01c94a=
946dcaeedaee2d0b382bae4c4cbf36&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-typogrify_2.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-typogr=
ify_2.0.7.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-t=
ypogrify_2.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-typogrify_2=
.0.7.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..3becb0dd8d<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-typ=
ogrify_2.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-typogrify_2.0=
.7.bb</a><br>
&gt; &gt; @@ -0,0 +1,14 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Filters to enhance web typography, including =
support for Django &amp; Jinja templates&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/mintchaos/typo=
grify" rel=3D"noreferrer" target=3D"_blank">https://github.com/mintchaos/ty=
pogrify</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D12bc792d6f5=
415dbf421f3fd183c6dd2&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pypi setuptools3<br>
&gt; &gt; +<br>
&gt; &gt; +PYPI_PACKAGE =3D &quot;typogrify&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;8be4668cda434163ce229d87ca273a1192=
2cb1614cb359970b7dc96eed13cb38&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-smartypants&quot;<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000356f2a05c199da7f--
