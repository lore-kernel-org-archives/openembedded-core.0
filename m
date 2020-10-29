Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.6402.1603964965578665846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L+jaJHIR;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id d125so551306vkh.10
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQBUYibx2L3Vkxl0z1QuimFXWXIpAZlbvmw3ntr51DQ=;
        b=L+jaJHIR7+CKYrxHzaJ+FnaUUYVa/VewTQ0IL/lksHa/35AAlvH8QN/lL4urdoe4z2
         yw8uV6voShGi6ACeYh0kgbP2OI6rlMhkGDQvfFRa/cFxO8mPlErxrKLITfFuJMAQbDuu
         EfxAZlRn9qiPslxRQSpK4nbwkPKMOtDOriAqQbbUx1UAyjbmf7YXM711eiF/Ygs6qXTd
         LJMf+cKN2qxwjIEu/U/2itx15nKoRBOLwdAn6Bz8IaVW+JdYctK0T54luZedEXhWx441
         TjyOd641EahGcyce6mYhflBTFZXqTVi1zUOkXQLYskdgJe9Do5dSSjO33xFHvuRW6RhI
         I7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQBUYibx2L3Vkxl0z1QuimFXWXIpAZlbvmw3ntr51DQ=;
        b=eIAVjJT5+akuBvJeSyUlyq5J8p3utxbOQ4tT56onV+nd8fwGd/zVV/z0l6w9Ai3ddw
         lJJQaUukPhohtlH1ddCMNE3NxlHC7f5wsPX5xNNYRWFpP+q0lIAwk5zWZBCfu7pAx9qi
         F/DURFmEBLyZpHLfXiWUiGXeWa4089Xm5xFMLtUMvCUD22fAJbn0XllpHM1gajJSQd0i
         fSIBziLD/VPWBZEKk/nufRgVDaV78sxAhea4BsMynFa9PDh9Vqe4ws4VS1pRrjvIviM7
         moh4CItEytICeZq27EQjL9PNFKRPzgve1xZZuunzOf/ixgpBzLUrOeNnBXM+h691FGyx
         h3xA==
X-Gm-Message-State: AOAM53259Kj/BdmYg9yFgRKizPv5UjY8X2fXDYtg7noLUqqITEiu5ZJu
	29GYRsMeUe62Q/2MYovPj4uhfx3NHqrphzAy8VM=
X-Google-Smtp-Source: ABdhPJwMc7GY3T89I10vVdQdE0dsRa/qTV3fu6KqxCoEPdHGxu+cRbv53QNIxaG1w7g7TaBog/O82H0PHFTzuJZzdMI=
X-Received: by 2002:a1f:a4cf:: with SMTP id n198mr2392289vke.0.1603964964679;
 Thu, 29 Oct 2020 02:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
 <20201028210558.21070-4-alex.kanavin@gmail.com> <CAMKF1sr1mHEyzgDaYGYK8Hk56ALN0HMqoPWu3KhKibe6UVAYuw@mail.gmail.com>
In-Reply-To: <CAMKF1sr1mHEyzgDaYGYK8Hk56ALN0HMqoPWu3KhKibe6UVAYuw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 10:49:13 +0100
Message-ID: <CANNYZj8DC9qQde+jwanJhMYyurmFh4ft0SQFWs9v=tGdjEj+zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/33] python3-pygobject: upgrade 3.36.1 -> 3.38.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f3b36c05b2cc3183"

--000000000000f3b36c05b2cc3183
Content-Type: text/plain; charset="UTF-8"

Upstream has changed the meson option type from boolean (true/false) to
feature (enabled/disabled/auto) in the new release.

Alex

On Wed, 28 Oct 2020 at 22:57, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...thon3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb =>
> python3-pygobject_3.38.0.bb} (78%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
> b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> > similarity index 78%
> > rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
> > rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> > index 0a34d4373f..b4427050f5 100644
> > --- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
> > +++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> > @@ -14,8 +14,7 @@ SRC_URI = " \
> >      http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz
> \
> >      file://0001-Do-not-build-tests.patch \
> >  "
> > -SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
> > -SRC_URI[sha256sum] =
> "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
> > +SRC_URI[sha256sum] =
> "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
> >
> >  UNKNOWN_CONFIGURE_WHITELIST = "introspection"
> >
> > @@ -27,7 +26,7 @@ RDEPENDS_${PN} += "python3-pkgutil"
> >
> >  # python3-pycairo is checked on configuration -> DEPENDS
> >  # we don't link against python3-pycairo -> RDEPENDS
> > -PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo
> python3-pycairo, python3-pycairo"
> > +PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo
> python3-pycairo, python3-pycairo"
> >
>
> is this a bug fix ? or a new change
>
> >  BBCLASSEXTEND = "native"
> >  PACKAGECONFIG_class-native = ""
> > --
> > 2.29.0
> >
> >
> > 
> >
>

--000000000000f3b36c05b2cc3183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Upstream has changed the meson option type from boole=
an (true/false) to feature (enabled/disabled/auto) in the new release.</div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2020 at 22:57, Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 28, =
2020 at 2:06 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://thon3-pygobject_3.36.1.bb" rel=3D"noreferr=
er" target=3D"_blank">thon3-pygobject_3.36.1.bb</a> =3D&gt; <a href=3D"http=
://python3-pygobject_3.38.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-pygobject_3.38.0.bb</a>} | 5 ++---<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-=
pygobject_3.36.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject=
_3.36.1.bb</a> =3D&gt; <a href=3D"http://python3-pygobject_3.38.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pygobject_3.38.0.bb</a>} (78%)<b=
r>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-p=
ygobject_3.36.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_=
3.36.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pygo=
bject_3.38.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.3=
8.0.bb</a><br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-py=
gobject_3.36.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3=
.36.1.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-pygo=
bject_3.38.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.3=
8.0.bb</a><br>
&gt; index 0a34d4373f..b4427050f5 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-pygobjec=
t_3.36.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.36.1.=
bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pygobjec=
t_3.38.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.38.0.=
bb</a><br>
&gt; @@ -14,8 +14,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ftp.gnome.org/pub/GNOME/sources=
/$%7BSRCNAME%7D/$%7B@gnome_verdir(" rel=3D"noreferrer" target=3D"_blank">ht=
tp://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir(</a>&quot;$=
{PV}&quot;)}/${SRCNAME}-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-build-tests.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;ebfebc4533856572281add29f08412bf&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d1bf42802d1cec113b5adaa0e7bf7f3745b4452=
1dc2163588d276d5cd61d718f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0372d1bb9122fc19f500a249b1f38c2bb674850=
00f5887497b4b205b3e7084d5&quot;<br>
&gt;<br>
&gt;=C2=A0 UNKNOWN_CONFIGURE_WHITELIST =3D &quot;introspection&quot;<br>
&gt;<br>
&gt; @@ -27,7 +26,7 @@ RDEPENDS_${PN} +=3D &quot;python3-pkgutil&quot;<br>
&gt;<br>
&gt;=C2=A0 # python3-pycairo is checked on configuration -&gt; DEPENDS<br>
&gt;=C2=A0 # we don&#39;t link against python3-pycairo -&gt; RDEPENDS<br>
&gt; -PACKAGECONFIG[cairo] =3D &quot;-Dpycairo=3Dtrue,-Dpycairo=3Dfalse, c=
airo python3-pycairo, python3-pycairo&quot;<br>
&gt; +PACKAGECONFIG[cairo] =3D &quot;-Dpycairo=3Denabled,-Dpycairo=3Ddisab=
led, cairo python3-pycairo, python3-pycairo&quot;<br>
&gt;<br>
<br>
is this a bug fix ? or a new change<br>
<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;=C2=A0 PACKAGECONFIG_class-native =3D &quot;&quot;<br>
&gt; --<br>
&gt; 2.29.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000f3b36c05b2cc3183--
