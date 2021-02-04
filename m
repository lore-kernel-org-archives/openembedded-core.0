Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web08.187.1612397476369749378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 16:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=WPheE2G+;
 spf=pass (domain: blade-group.com, ip: 209.85.217.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vs1-f51.google.com with SMTP id x201so886754vsc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xl+bE3b/DBLyG+MuHcQtzh9GgC6xJqRuZfaN8/HRn/o=;
        b=WPheE2G+Zl1UKV+bFgz9kfBbuqJ+93RfbG6UhHHFYOQDxOGUfkVH1rNyT+N3RDuieF
         TwoVD3rvlmsXb44Kb3swep4OBSIOp3visgmSfTnofDIaoT+wIGq0qvBhTb3XtXR+DDhQ
         pnE5ByDzsW8vJwkBj5F5g9kGlpwe2RccpujV8/hGT+BtjbedhjQX1Tx8kpclaY8Oo/3W
         EeOI1ozTmhMFcTgnCExxzI/+TywqWTAKRMg7l2jElV5xuStC/M19GdH1QxMPdNyeei36
         /dxDwa5NBlN7Ac8g+ResJLRGq751d0vPnsITwPFMYo/gtWITDsYk83c36G2OIupkg5DA
         fmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xl+bE3b/DBLyG+MuHcQtzh9GgC6xJqRuZfaN8/HRn/o=;
        b=oHQ0YyNgEiiZhvD+VEuVsS8twNXyy2kZAasZRm/X0451n9/1MtxSEksXC9zlFQ5/Nd
         D6SJmdprTTv6Q8mdTzUW3IHndkXbwnkgy0VVGtvZztqFPmQOGx74rDTfh5Kjy1DAFxs3
         EZxAHHkUw1abPEd3UbZ2CIakdQIFFzoYm07po2BUp/hvSUjUHE8vdQD9SQUkAW0SYkQZ
         2tsnAQOC8HKlU8ADpslrsSIKcmM/SuAWTJikwYxc31dltAPDVMl2ps50kfMFSHeOepcs
         4ISeHM50/6fCSw1+BMR4ZLojS//lLyF+OipnIDiv+J7WUwlqP5Sd0ezwJEhoHWF+w1Xg
         MneQ==
X-Gm-Message-State: AOAM530ShAYzqDdeD+Nnr87GiTmLWudHyLGmfe0Ivc4UA/Tubl/FDopQ
	z65Ed0rlS3jR0SYEygqHYfJ8KglCFBEiNhAi9RABcQ==
X-Google-Smtp-Source: ABdhPJz6wnSyO7nUjz1aBCkwbzalk0TRBTNuzhQA4dcO2OPyLsa9eQvE/G5LfUxiJvkpgbQjGsAxAkJkM8CNMo23RjY=
X-Received: by 2002:a05:6102:7b1:: with SMTP id x17mr3525418vsg.41.1612397475496;
 Wed, 03 Feb 2021 16:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20210201102300.3789714-1-yann@blade-group.com> <CAHtQpK6c8cHp5qn6wjC5jyha5i2Q57KuVy6EVVyXuRJcLg9b9g@mail.gmail.com>
In-Reply-To: <CAHtQpK6c8cHp5qn6wjC5jyha5i2Q57KuVy6EVVyXuRJcLg9b9g@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Thu, 4 Feb 2021 01:11:04 +0100
Message-ID: <CA+4=imaUEgCL4reQ3xAh=vYUK6wfOspb0ti5k6Onw2WDTZxQTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: upgrade to 2.0.14
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>, =?UTF-8?Q?Romain_Roff=C3=A9?= <romain.roffe@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000c39e4005ba778a1f"

--000000000000c39e4005ba778a1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 3 f=C3=A9vr. 2021 =C3=A0 21:56, Andrey Zhizhikin <andrey.z@gmail.co=
m> a
=C3=A9crit :

> Hello Yann,
>
> > index 5fa99821c4..872592fdae 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
> > @@ -18,14 +18,11 @@ PROVIDES =3D "virtual/libsdl2"
> >
> >  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> >             file://more-gen-depends.patch \
> > -           file://directfb-spurious-curly-brace-missing-e.patch \
> > -           file://directfb-renderfillrect-fix.patch \
>
> I believe the patch ac_check_define.patch can also be dropped, as it
> was applied upstream and is included in 2.0.14, see
> http://hg.libsdl.org/SDL/rev/2c13b7ca1997
>

hm, not sure what patch you're talking about, I don't see any by that name=
.


> >  "
> >
> >  S =3D "${WORKDIR}/SDL2-${PV}"
> >
> > -SRC_URI[md5sum] =3D "783b6f2df8ff02b19bb5ce492b99c8ff"
>
> Wonder why md5sum was just dropped and rather not updated?
>

It's an obsolete algorithm. AUH itself removes this in its patches.


> > -SRC_URI[sha256sum] =3D
> "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
> > +SRC_URI[sha256sum] =3D
> "d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc"
> >
> >  inherit autotools lib_package binconfig-disabled pkgconfig
> >
> > @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]       =3D
> "--enable-jack,--disable-jack,jack"
> >  PACKAGECONFIG[kmsdrm]     =3D
> "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
> >  PACKAGECONFIG[opengl]     =3D
> "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
> >  PACKAGECONFIG[pulseaudio] =3D
> "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> > -PACKAGECONFIG[tslib]      =3D
> "--enable-input-tslib,--disable-input-tslib,tslib"
> >  PACKAGECONFIG[wayland]    =3D
> "--enable-video-wayland,--disable-video-wayland,wayland-native wayland
> wayland-protocols libxkbcommon"
> >  PACKAGECONFIG[x11]        =3D
> "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr
> libxrender"
> >
> > --
> > 2.29.2
> >
> >
> >=20
> >
>
>
> --
> Regards,
> Andrey.
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000c39e4005ba778a1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 3 f=C3=A9vr. 2021 =C3=A0=
=
=C2=A021:56, Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com">an=
drey.z@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello Yann,<br>
<br>&gt; index 5fa99821c4..872592fdae 100644<br>
&gt; --- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.12.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.12.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.14.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.14.bb</a><br>
&gt; @@ -18,14 +18,11 @@ PROVIDES =3D &quot;virtual/libsdl2&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.libsdl.org/release/SDL2=
-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.o=
rg/release/SDL2-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://more-gen-depend=
s.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://directfb-spurious-cu=
rly-brace-missing-e.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://directfb-renderfillr=
ect-fix.patch \<br>
<br>
I believe the patch ac_check_define.patch can also be dropped, as it<br>
was applied upstream and is included in 2.0.14, see<br>
<a href=3D"http://hg.libsdl.org/SDL/rev/2c13b7ca1997" rel=3D"noreferrer" t=
arget=3D"_blank">http://hg.libsdl.org/SDL/rev/2c13b7ca1997</a><br></blockqu=
ote><div><br></div><div>hm, not sure what patch you&#39;re talking about, I=
 don&#39;t see any by that name.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/SDL2-${PV}&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;783b6f2df8ff02b19bb5ce492b99c8ff&quot;<br>
<br>
Wonder why md5sum was just dropped and rather not updated?<br></blockquote=
><div><br></div><div>It&#39;s an obsolete algorithm. AUH itself removes thi=
s in its patches.<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; -SRC_URI[sha256sum] =3D &quot;349268f695c02efbc9b9148a70b85e58cefbbf7=
04abd3e91be654db7f1e2c863&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;d8215b571a581be1332d2106f8036fcb03d12a7=
0bae01e20f424976d275432bc&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools lib_package binconfig-disabled pkgconfig<br>
&gt;<br>
&gt; @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;--enable-jack,--disable-jack,jack&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[kmsdrm]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vid=
eo-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[opengl]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vid=
eo-opengl,--disable-video-opengl,virtual/libgl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pulseaudio] =3D &quot;--enable-pulseaudio,--disab=
le-pulseaudio,pulseaudio&quot;<br>
&gt; -PACKAGECONFIG[tslib]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-input-ts=
lib,--disable-input-tslib,tslib&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =3D &quot;--enable-video-wa=
yland,--disable-video-wayland,wayland-native wayland wayland-protocols libx=
kbcommon&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enabl=
e-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender=
&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000c39e4005ba778a1f--
