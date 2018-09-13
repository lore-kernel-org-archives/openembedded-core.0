Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 52FFA79934
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:47:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 20-v6so6848754wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IMLEcmrmvqeh7umV6ZcvJooluFyRRwg9O9eqX0dj0hU=;
	b=F/e4CBQSjb9jsZApKylsg8WKuAs3SS2xRF+cVKfozStyFnJea2/JSj9m5Xgxo0YA8Q
	JroiweG3L0nirZQvQRSCQE7Zt4yApn6vtt05gmW4XfNpTOyjlA9v9SXceohCesdq/9eH
	Upwi4qy9kCxQ8T7rbZKJWwswO167Zuws10GikapHH/h9iFW2iwRPZ6yeriUH+QG5ck8U
	73uZPkOTrnSpMzqycXOq2UZPtGtgesRz5vbDwA5e2jArPr33ii85+1geLL04xK/ythLL
	kbB7YJ+HLOM4mQ73I8wVoTTjmg0C8lCBXtHgj5+wsLu1ir0LbOcGrrCCSygnFdRz3U36
	p69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IMLEcmrmvqeh7umV6ZcvJooluFyRRwg9O9eqX0dj0hU=;
	b=RDZvq7I/Eg2b9r1nwkpK5JxsybR8EtiPmwPzE8+QUCAS0d8Z12nyQC0x+aK/Pz5vV7
	x/CPvz8VQKj5+1q/41bthDBzSFECcXqMIRqsSIprq2iuNTkHjocqcW4J/QoMOHxFGFlj
	dCwjGZGlzTpQb8it/ZN2dNBnDUJ/2bmlSEtNsZZVpVMDo2pFGjyTGJpGpIJ6Gl434cKP
	Q52CIWwaVTpGYU2ROcXOAly/gi89uVlnjT6IKYqev1FIg7MK5NTf1/fuYjG/UUhNdU6b
	3ZcC9+WE392Rm/QtQpH/n2OWFxZaFo+nVCkFDmRqOCpBMdhltTsqYqu3iR4+syTpr/W5
	203A==
X-Gm-Message-State: APzg51AHlNBcSBr/xz5xDFqujFB1JmPSt9mGbeE5DzKoFGZXPHm/Yt/k
	6YiJO+0XRxLgbWKz3RqEpAnA5RNRLfQTqOPXs8U=
X-Google-Smtp-Source: ANB0Vdb4Zqpjn7fxJRc1U0iTATQzWTnYkoJnl15MKqSEwFUNkyTLrA1dL9MdcdwIzRa3j3Wikb3/aTanSBf5ePOHfyA=
X-Received: by 2002:a1c:1eca:: with SMTP id
	e193-v6mr5812879wme.99.1536857279885; 
	Thu, 13 Sep 2018 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180911093750.5460-1-ross.burton@intel.com>
	<CAMKF1spTqL8tug6OAcAeo6EPNysTiadQj+xhKrs==G-szv4f4g@mail.gmail.com>
In-Reply-To: <CAMKF1spTqL8tug6OAcAeo6EPNysTiadQj+xhKrs==G-szv4f4g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Sep 2018 18:47:50 +0200
Message-ID: <CA+chaQfHVfF0ryUyw9EP9FmQM9AUSCDMLanVLH+qKGKRpiCWZw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yasm: remove
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
X-List-Received-Date: Thu, 13 Sep 2018 16:47:59 -0000
Content-Type: multipart/alternative; boundary="0000000000003cf7a40575c37848"

--0000000000003cf7a40575c37848
Content-Type: text/plain; charset="UTF-8"

FYI: I'm testing if qtwebengine from meta-qt5 will work with nasm-native.

On Thu, Sep 13, 2018 at 6:39 PM Khem Raj <raj.khem@gmail.com> wrote:

> There are packages in other layers e.g. firefox which still depend on
> yasm. Can we move it to meta-oe instead of completely dropping it.
> On Tue, Sep 11, 2018 at 2:38 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > Nothing in oe-core is using yasm now that gstreamer-libav and ffmpeg are
> using
> > nasm, so remove it from oe-core.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc |  1 -
> >  meta/recipes-devtools/yasm/yasm_1.3.0.bb | 16 ----------------
> >  2 files changed, 17 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 2ecc3d61e38..0c65e8f816c 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -732,6 +732,5 @@ RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <
> maxin.john@intel.com>"
> >  RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
> >  RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
> >  RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
> > -RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
> >  RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
> > diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
> b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
> > deleted file mode 100644
> > index 31af1e287e9..00000000000
> > --- a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
> > -LICENSE = "BSD"
> > -HOMEPAGE = "http://www.tortall.net/projects/yasm/"
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
> > -
> > -SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
> > -SRC_URI[sha256sum] =
> "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
> > -
> > -export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
> > -
> > -inherit autotools gettext
> > -
> > -BBCLASSEXTEND = "native"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003cf7a40575c37848
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: I&#39;m testing if qtwebengine from meta-qt5 will wor=
k with nasm-native.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Thu, Sep 13, 2018 at 6:39 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">There are packages in other layers e.g. firefox which still depend on<=
br>
yasm. Can we move it to meta-oe instead of completely dropping it.<br>
On Tue, Sep 11, 2018 at 2:38 AM Ross Burton &lt;<a href=3D"mailto:ross.burt=
on@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Nothing in oe-core is using yasm now that gstreamer-libav and ffmpeg a=
re using<br>
&gt; nasm, so remove it from oe-core.<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc |=C2=A0 1 -<br>
&gt;=C2=A0 meta/recipes-devtools/yasm/<a href=3D"http://yasm_1.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_1.3.0.bb</a> | 16 ----------------<b=
r>
&gt;=C2=A0 2 files changed, 17 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/yasm/<a href=3D"http://=
yasm_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">yasm_1.3.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 2ecc3d61e38..0c65e8f816c 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -732,6 +732,5 @@ RECIPE_MAINTAINER_pn-xvideo-tests =3D &quot;Maxin =
B. John &lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin=
.john@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-xvinfo =3D &quot;Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-xwininfo =3D &quot;Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-xz =3D &quot;Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-yasm =3D &quot;Yi Zhao &lt;<a href=3D"mailto:yi.=
zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quot;<b=
r>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-zip =3D &quot;Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-zlib =3D &quot;Denys Dmytriyenko &lt;<a hre=
f=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/yasm/<a href=3D"http://yasm_1.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">yasm_1.3.0.bb</a> b/meta/recipes-de=
vtools/yasm/<a href=3D"http://yasm_1.3.0.bb" rel=3D"noreferrer" target=3D"_=
blank">yasm_1.3.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 31af1e287e9..00000000000<br>
&gt; --- a/meta/recipes-devtools/yasm/<a href=3D"http://yasm_1.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_1.3.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,16 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;x86 (SSE) assembler supporting NASM and GAS-syntaxe=
s&quot;<br>
&gt; -LICENSE =3D &quot;BSD&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.tortall.net/projects/yasm/" =
rel=3D"noreferrer" target=3D"_blank">http://www.tortall.net/projects/yasm/<=
/a>&quot;<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da12d8903508fb6bfd49d8=
d82c6170dd9&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://www.tortall.net/projects/yasm/rel=
eases/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.tor=
tall.net/projects/yasm/releases/${BP}.tar.gz</a>&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;fc9e586751ff789b34b1f21d572d96af&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3dce6601b495f5b3d45b59f7d2492a340ee7e84b=
5beca17e48f862502bd5603f&quot;<br>
&gt; -<br>
&gt; -export CCLD_FOR_BUILD =3D &quot;${CC_FOR_BUILD}&quot;<br>
&gt; -<br>
&gt; -inherit autotools gettext<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003cf7a40575c37848--
