Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.141773.1598039480239653497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rV+k7WJe;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 144so2410965qkl.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2x72iHnmCGqLP0+k7CuG6kMBnaRKTAqDN8m4UbPuiD0=;
        b=rV+k7WJe+VO7mpzvCw87z++QZR7eJr+IxKAdAKj5++qt3GkDoHfcdoP540bI7+X2y4
         RYwdqcJiPPVjfvZpsdtRGAcUZ37T1L73Z1+G1TqrcC3mvDgisO4pFLBhzPxaWN+Eryie
         +UNB90ErDwCx3fLt43MLYGR0nGISRRILtMollrwxxJ41M4MT3VChSZa1JqXrcBUN1MIv
         GlS61CYNv0PoYrdKe7vqv1rm4TQ36a/hNGj33VY+SjMGeuQZrCpwY5GJzMcU0SrpGKB/
         /mIFoELfcoSinfNfsOakNHWXTFhh631UQ+5vO8iig2uOX7SjHY19ovh0BrFgxZcGEDVo
         8Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2x72iHnmCGqLP0+k7CuG6kMBnaRKTAqDN8m4UbPuiD0=;
        b=UCHPGARgUProlCB/cFu/mTqan+tqO5OLG4Ifai/EdR0Er8bDqbDTzwO0Y6DKJd5Bnn
         /unbtjW9hNVhC5o5N66XyVHtNZy9SIGpmVSLuE1EJUwHE6Ytw2dOJl+8yjQP+CvLvGjw
         G7BT2xGNYiZ0FTerTdMAreZB+UVvVWYOGL1A42VLzJkL3AUUDVecYhXNpQDdvoSitVGv
         /9+yoo+ZUT7Ruao4iP9gkOAszvgGi807ieN/KlvAeymw90sAM6zcxHV92Z4H7WE3maTJ
         0fqHeOLgYO3t0B9tnPnUjsFNDyx+QjBUt1Rr27RhFMve0Dphck+X9pbGHV6qgxs+NPZj
         Q9QQ==
X-Gm-Message-State: AOAM531EVWMIFSM9z4BDaGTHVyyB/fJoAgI1MiAptkvfFsGRzA+Z8kA1
	Tk/C65Qyn0D+xCRhHgoWImnHeY4Pl7lK2n5Rp2Y=
X-Google-Smtp-Source: ABdhPJzexF0ojTIH5jrS0XNKKe+VJe3FEPHA5ced44D7srnneTDOyLlxXiCn4xMLN4EPf8frPH4Tas47yQPSERvWBGc=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr4391785qke.9.1598039479322;
 Fri, 21 Aug 2020 12:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200820080115.2715139-1-raj.khem@gmail.com> <20200820080115.2715139-2-raj.khem@gmail.com>
 <9ff64eca0998e51759073fbfd08f2e005ec328f2.camel@linuxfoundation.org>
In-Reply-To: <9ff64eca0998e51759073fbfd08f2e005ec328f2.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 21 Aug 2020 12:51:08 -0700
Message-ID: <CAMKF1sqg=LfNWwdNC_5C+JtUoExYuY1jQyHFUK6UXjcyY1z0fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/3] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Leon Woestenberg <leon@sidebranch.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000808d6c05ad688fdc"

--000000000000808d6c05ad688fdc
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 3:51 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-08-20 at 01:01 -0700, Khem Raj wrote:
>
> > gcc needs -mmusl option to be passed in SDK since we ship crossdk
> compiler
>
> > configured for glibc by default, this helps in creating correct
>
> > compiler defaults for musl based SDK compilers
>
> >
>
> > [YOCTO #13459]
>
> >
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> > Cc: Leon Woestenberg <leon@sidebranch.com>
>
> > ---
>
> > v2: Delete file before creating wrapper
>
> >
>
> >  .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
>
> >  1 file changed, 23 insertions(+)
>
> >
>
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>
> > index 553ef7fe62..c5935b978d 100644
>
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>
> > @@ -139,6 +139,29 @@ do_install () {
>
> >       chown -R root:root ${D}
>
> >
>
> >       cross_canadian_bindirlinks
>
> > +
>
> > +     for i in linux ${CANADIANEXTRAOS}
>
> > +     do
>
> > +             for v in ${CANADIANEXTRAVENDOR}
>
> > +             do
>
> > +                     d=${D}${bindir}/../${TARGET_ARCH}$v-$i
>
> > +                     install -d $d
>
> > +                     for j in ${TARGET_PREFIX}gcc${EXEEXT}
> ${TARGET_PREFIX}g++${EXEEXT}
>
> > +                     do
>
> > +                             p=${TARGET_ARCH}$v-$i-`echo $j | sed -e
> s,${TARGET_PREFIX},,`
>
> > +                             case $i in
>
> > +                             *musl*)
>
> > +                                     rm -rf $d/$p
>
> > +                                     echo "#!/usr/bin/env sh" > $d/$p
>
> > +                                     echo "exec \`dirname
> \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
>
> > +                                     chmod 0755 $d/$p
>
> > +                                     ;;
>
> > +                             *)
>
> > +                                     ;;
>
> > +                             esac
>
> > +                     done
>
> > +             done
>
> > +     done
>
> >  }
>
> >
>
> >  ELFUTILS = "nativesdk-elfutils"
>
>
>
> I've bisected this error in mingw:
>
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/2341
>
>
>
> to this change.
>
>
>
> Error:
>
>  Problem: package gcc-cross-canadian-i686-10.2.0-r0.i686_nativesdk_mingw32
> requires /usr/bin/env, but none of the providers can be installed
>
>   - package
> packagegroup-cross-canadian-qemux86-1.0-r0.i686_nativesdk_mingw32 requires
> gcc-cross-canadian-i686, but none of the providers can be installed
>
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with /bin/sh provided by
> nativesdk-curl-7.71.1-r0.i686_nativesdk_mingw32
>
>   - conflicting requests
>
> (try to add '--allowerasing' to command line to replace conflicting
> packages or '--skip-broken' to skip uninstallable packages)
>
>
>
> This is due to the addition of the /usr/bin/env dependency to the
>
> generated files.
>
>
>
> I'm trying to unravel the problems but it may mean extra fixes to both
>
> meta-mingw and master handling of /bin/sh.


Maybe we can call out /bin/sh directly will that work on mingw

>
>
>
>
> Cheers,
>
>
>
> Richard
>
>
>
>

--000000000000808d6c05ad688fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 21, 2020 at 3:51 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2020-=
08-20 at 01:01 -0700, Khem Raj wrote:<br><br>&gt; gcc needs -mmusl option t=
o be passed in SDK since we ship crossdk compiler<br><br>&gt; configured fo=
r glibc by default, this helps in creating correct<br><br>&gt; compiler def=
aults for musl based SDK compilers<br><br>&gt; <br><br>&gt; [YOCTO #13459]<=
br><br>&gt; <br><br>&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br><br>&gt; Cc=
: Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebranch.com" target=3D"_bl=
ank">leon@sidebranch.com</a>&gt;<br><br>&gt; ---<br><br>&gt; v2: Delete fil=
e before creating wrapper<br><br>&gt; <br><br>&gt;=C2=A0 .../gcc/gcc-cross-=
canadian.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++=
+++++++++++++++++<br><br>&gt;=C2=A0 1 file changed, 23 insertions(+)<br><br=
>&gt; <br><br>&gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadia=
n.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc<br><br>&gt; index =
553ef7fe62..c5935b978d 100644<br><br>&gt; --- a/meta/recipes-devtools/gcc/g=
cc-cross-canadian.inc<br><br>&gt; +++ b/meta/recipes-devtools/gcc/gcc-cross=
-canadian.inc<br><br>&gt; @@ -139,6 +139,29 @@ do_install () {<br><br>&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}<br><br>&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0<br><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cross_canadian_bindirl=
inks<br><br>&gt; +<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0for i in linux ${CANADI=
ANEXTRAOS}<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0do<br><br>&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for v in ${CANADIANEXTRAVENDOR}<br><br>&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do<br><br>&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d=3D${=
D}${bindir}/../${TARGET_ARCH}$v-$i<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d $d<br><br>&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}<br><b=
r>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0do<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=3D${TARGET_ARCH}$v=
-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`<br><br>&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0case $i in<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*musl*)<b=
r><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf=
 $d/$p<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;#!/usr/bin/env sh&quot; &gt; $d/$p<br><br>&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;exec \`dirname \$0\=
`/../${TARGET_SYS}/$j -mmusl \$@&quot; &gt;&gt; $d/$p<br><br>&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 0755 $d/$p<br><br=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br><br=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0esac<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0done<br><br>&gt; +=C2=A0 =C2=A0 =C2=A0done<br><br>&=
gt;=C2=A0 }<br><br>&gt;=C2=A0 <br><br>&gt;=C2=A0 ELFUTILS =3D &quot;natives=
dk-elfutils&quot;<br><br><br><br>I&#39;ve bisected this error in mingw:<br>=
<br><br><br><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/build=
ers/89/builds/2341" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/89/builds/2341</a><br><br><br><br>to =
this change.<br><br><br><br>Error: <br><br>=C2=A0Problem: package gcc-cross=
-canadian-i686-10.2.0-r0.i686_nativesdk_mingw32 requires /usr/bin/env, but =
none of the providers can be installed<br><br>=C2=A0 - package packagegroup=
-cross-canadian-qemux86-1.0-r0.i686_nativesdk_mingw32 requires gcc-cross-ca=
nadian-i686, but none of the providers can be installed<br><br>=C2=A0 - pac=
kage target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts w=
ith /bin/sh provided by nativesdk-curl-7.71.1-r0.i686_nativesdk_mingw32<br>=
<br>=C2=A0 - conflicting requests<br><br>(try to add &#39;--allowerasing&#3=
9; to command line to replace conflicting packages or &#39;--skip-broken&#3=
9; to skip uninstallable packages)<br><br><br><br>This is due to the additi=
on of the /usr/bin/env dependency to the<br><br>generated files.<br><br><br=
><br>I&#39;m trying to unravel the problems but it may mean extra fixes to =
both<br><br>meta-mingw and master handling of /bin/sh.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Maybe we can call out /bin/sh directl=
y will that work on mingw=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br=
><br><br>Cheers,<br><br><br><br>Richard<br><br><br><br></blockquote></div><=
/div>

--000000000000808d6c05ad688fdc--
