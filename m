Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.214.1615321421798615427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 12:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1heUB8I;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: dorindabassey@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e7so13360464ile.7
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 12:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBrB1pj9rXRaqDrrRNb0mWDMHFQLvxkyTygwZEYicbg=;
        b=A1heUB8Iy0h2fk6rSokr6XAIHYeC+7EzG78d9ROxoIN5Ja2H/da/ZfpdGgCrunX2iH
         TaqDG1dOedGlgVFKA96qoGhb/5Q1BEBkyVdaSYqOhyHAhPoK4C0Mgb/IsAjxXCNjRTBH
         JUuV7JqoI3DXnMiBRGa5M1jyBMkLKpjhXMIJeTiPZ0HwtInRsU8i0KJk1f8n6Higa5WY
         HfFsESSoox30ltGVppUFxTNKe/4hS0Byi9D/QFNQ/w55UP/B/aaviQ0zeyVZrxGI2r7f
         hZnIF3feyY+hwL4A+iCokGuhdVDcKaetOCweGfYu7G8cMlS2wxuW8s1dmuF0SpmhqIn+
         Ehsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBrB1pj9rXRaqDrrRNb0mWDMHFQLvxkyTygwZEYicbg=;
        b=kmOvhK53mSm8RIZXimc7f1A7oAMdRxqLwIRaju78KNZHWNJ5Q6eI9Pyn1p4uMjkQtA
         yq5V5M/RltrcLKCAS6TvUDvK85mjVhOtlOmvEW243ebNjtiotQ70KgXQayQqZDwAYj1a
         9IO0yIYAHbhzhJVLstgrps9N5Zz6Zq/T7uE+FivZ+82oMcgKXsqjcVCnFSPxbR0kHceG
         9KoaXOCkz+nnH1hoxZHsUZ+ET/LTUyvWs6c6+Om4wTvBY/mAFawDu/BjpXRBJF6sZtuE
         KB434GD1gCZc+97PGNBhXm8XqFpeidmNIkxqqf/x/BBiEQIc6GT+BLMHGNA5gsb6NNyk
         K9Jg==
X-Gm-Message-State: AOAM533X2MA6WYqUsZIxBXwcKb0nvbZVjb0rs2RnxMJuV9t9M7tGb4cy
	tGnADKYY7Ufi2UMJWjsZrsAJ2EsfW7NqQNsp/EA=
X-Google-Smtp-Source: ABdhPJyWJYXmY9mgCTjWg0uAOsa7SWsBmDq70vp5VPI55SXlehEhzP3x47gWe2uFtKwO+ZXY3ChafyxJF6ryfPnNnHM=
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id u13mr25925120ilv.176.1615321421196;
 Tue, 09 Mar 2021 12:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20210309113551.13691-1-dorindabassey@gmail.com> <db7558f9b4279027b8f920e70157fce70fea29af.camel@linuxfoundation.org>
In-Reply-To: <db7558f9b4279027b8f920e70157fce70fea29af.camel@linuxfoundation.org>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Tue, 9 Mar 2021 21:23:28 +0100
Message-ID: <CAJSnhzumJejcP6rGFkkp3U8=DqkoKczFLZKz5_9dtoG944amXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008232a605bd20530e"

--0000000000008232a605bd20530e
Content-Type: text/plain; charset="UTF-8"

Yes I agree,

> +DESCRIPTION = "${SUMMARY}"

I was actually contemplating this before.

Thanks,
Dorinda.

On Tue, Mar 9, 2021, 17:47 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-03-09 at 12:35 +0100, Dorinda wrote:
> > Added missing HOMEPAGE and DESCRIPTION found using the test command
> > `oe-selftest -r distrodata.Distrodata.test_missing_homepg`
> >
> > [YOCTO #13471]
> >
> > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python-cython.inc               | 2 ++
> >  meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb      | 2 ++
> >  meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb      | 2 ++
> >  meta/recipes-devtools/python/python3-jinja2_2.11.3.bb        | 1 +
> >  meta/recipes-devtools/python/python3-pygobject_3.38.0.bb     | 2 ++
> >  meta/recipes-devtools/python/python3-pytest_6.2.2.bb         | 2 ++
> >  meta/recipes-devtools/python/python3-scons_3.1.2.bb          | 1 +
> >  meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb | 2 ++
> >  8 files changed, 14 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python-cython.inc
> b/meta/recipes-devtools/python/python-cython.inc
> > index da6eba254f..0e6bac06a7 100644
> > --- a/meta/recipes-devtools/python/python-cython.inc
> > +++ b/meta/recipes-devtools/python/python-cython.inc
> > @@ -1,3 +1,5 @@
> > +SUMMARY = "The Cython language"
> > +HOMEPAGE = "https://pypi.org/project/Cython/"
> >  DESCRIPTION = "Cython is a language specially designed for writing
> Python extension modules. \
> >  It's designed to bridge the gap between the nice, high-level,
> easy-to-use world of Python \
> >  and the messy, low-level world of C."
> > diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> > index b1feee8416..6dc376efe6 100644
> > --- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> > +++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> > @@ -1,4 +1,6 @@
> >  SUMMARY = "With this program/Python library you can easily create mock
> objects on D-Bus"
> > +HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
> > +DESCRIPTION = "${SUMMARY}"
>
> I believe this is already the default from bitbake.conf so we don't
> need to add this?
>
> Cheers,
>
> Richard
>
>

--0000000000008232a605bd20530e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yes I agree,</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><span style=3D"font-family:sans-serif">&gt; +DESCRIPTION =3D &q=
uot;${SUMMARY}&quot;</span><br style=3D"font-family:sans-serif"></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I was actually contemplating this =
before.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div=
><div dir=3D"auto">Dorinda.<br><br><div class=3D"gmail_quote" dir=3D"auto">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 9, 2021, 17:47 Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Tue, 2021-03-09 at 12:35 +0100, Dorinda wrote:<br>
&gt; Added missing HOMEPAGE and DESCRIPTION found using the test command<br=
>
&gt; `oe-selftest -r distrodata.Distrodata.test_missing_homepg`<br>
&gt; <br>
&gt; [YOCTO #13471]<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">dorindabassey@gmail.com</a>&gt;=
<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/python/python-cython.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-dbusmock_=
0.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-dbusmock=
_0.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-iniconfig=
_1.1.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-iniconfi=
g_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-jinja2_2.=
11.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-jinja2_2.1=
1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pygobject=
_3.38.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pygobje=
ct_3.38.0.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pytest_6.=
2.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pytest_6.2.=
2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.1=
.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-scons_3.1.2.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-setuptool=
s-scm_5.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-set=
uptools-scm_5.0.1.bb</a> | 2 ++<br>
&gt; =C2=A08 files changed, 14 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/rec=
ipes-devtools/python/python-cython.inc<br>
&gt; index da6eba254f..0e6bac06a7 100644<br>
&gt; --- a/meta/recipes-devtools/python/python-cython.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python-cython.inc<br>
&gt; @@ -1,3 +1,5 @@<br>
&gt; +SUMMARY =3D &quot;The Cython language&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Cython/" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://pypi.org/project/Cytho=
n/</a>&quot;<br>
&gt; =C2=A0DESCRIPTION =3D &quot;Cython is a language specially designed fo=
r writing Python extension modules. \<br>
&gt; =C2=A0It&#39;s designed to bridge the gap between the nice, high-level=
, easy-to-use world of Python \<br>
&gt; =C2=A0and the messy, low-level world of C.&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-db=
usmock_0.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-d=
busmock_0.22.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-dbusmock_0.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pyt=
hon3-dbusmock_0.22.0.bb</a><br>
&gt; index b1feee8416..6dc376efe6 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-dbusmock_=
0.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-dbusmock=
_0.22.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-dbusmock_=
0.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-dbusmock=
_0.22.0.bb</a><br>
&gt; @@ -1,4 +1,6 @@<br>
&gt; =C2=A0SUMMARY =3D &quot;With this program/Python library you can easil=
y create mock objects on D-Bus&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/python-dbusmoc=
k/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://pypi.org/projec=
t/python-dbusmock/</a>&quot;<br>
&gt; +DESCRIPTION =3D &quot;${SUMMARY}&quot;<br>
<br>
I believe this is already the default from bitbake.conf so we don&#39;t=C2=
=A0<br>
need to add this?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--0000000000008232a605bd20530e--
