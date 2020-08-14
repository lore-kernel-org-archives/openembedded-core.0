Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.15029.1597399901617151403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 03:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=BCQilkG0;
 spf=softfail (domain: sidebranch.com, ip: 209.85.160.194, mailfrom: leon@sidebranch.com)
Received: by mail-qt1-f194.google.com with SMTP id s16so6513260qtn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WstdJTztp0WzVE0UbqDrDmjuwhh3LXT+PoWMCrSapjc=;
        b=BCQilkG0ds6bUVIYH8lh4EXDrqmhD9WUXnkIVMYg3/KCNk6aV7fDos092juULwBSaq
         Xnm4Kiu24OxPlHzDVdcirLgIulL9ZigB59ZEtN33gFJlONkm/g+1xX+BowVp7O9X9XQK
         QaZEHOR9++x/uxslWeR/pFNjjAkh/pd5fJrOhNpKa9zU0PVYktI10FhQpdPzO5NBCLAk
         0Ec214khP7jw5BGPhx0PDrifk9aubkXTWsnN5Klf0jijp5tFClsrQtw8IbKzaY44nDve
         zQSwuVl8q6U0BxGjbYl7WiicMw6VKxUaFXJ5+Yz5BAwAkG+apguSBfAmSH3v2Jm6pmq0
         dPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WstdJTztp0WzVE0UbqDrDmjuwhh3LXT+PoWMCrSapjc=;
        b=g2BJevNqqheT6jgiUMpndJRWU/pviYSwyiD2LCmL+WC6+MNjlA5dLIsaawydW9wapQ
         gognzvkcXThgjl//VqcDyuSR3NdlWq73bKCwyJ7Xk/uR96+6rdHQWr1kjFVTDYLF/jeT
         mHNSCvcdijUpiyBqXiHUM/yR3XtdF1CIfBLmg7kBlJEJc5XhbYn2Bm4HjT7t/J4UzpVg
         gu6jkbzJU9I8QkfYO52YlRo6/T/znsC0HOF1QfM5r/kdaqlX/GWOGE0IIBLRqQ2FidJe
         Z7GyIH+9s3oXLGR2+x2a5Dsu5Fd9lrrTBwpxGiJJMgzQD2wfEyxdT1ahtHp/imHK2ups
         lyZA==
X-Gm-Message-State: AOAM531Nm7p9uOzaWEPCoixykxwXbHTNzoqZceVP++lNPnZIQi3t6b0v
	WR7TjCPAQfuwRqqYSlzkPnedjQbCkBFEUfKJjiBdaHP0sAtoFA==
X-Google-Smtp-Source: ABdhPJwwqERpByLmUwRpes+SzKBgWXqPcEJTAsKvun/MjWAzrVk0xKocTu0sxOsvVjvAIIzNiKVy7UMG9XQqnVs4kGo=
X-Received: by 2002:ac8:66d3:: with SMTP id m19mr1327304qtp.276.1597399900525;
 Fri, 14 Aug 2020 03:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <1597319535-5254-1-git-send-email-leon@sidebranch.com> <CAAnfSTvrwN-xNPAvtXeyf7RmeU5s2ag6ygS3bST-N-GmCtq0ew@mail.gmail.com>
In-Reply-To: <CAAnfSTvrwN-xNPAvtXeyf7RmeU5s2ag6ygS3bST-N-GmCtq0ew@mail.gmail.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Fri, 14 Aug 2020 12:11:29 +0200
Message-ID: <CAMjhiJiDrZkeMq0VJgmmnU7cAvs4S4E_V+qveVkQk4RuFPCYig@mail.gmail.com>
Subject: Re: [oe-core][zeus][PATCH] cmake-native: Use cmake-provided zstd library; system library might be too old.
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a2b14f05acd3a541"

--000000000000a2b14f05acd3a541
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Aug 2020 at 12:00, Ross Burton <ross@burtonini.com> wrote:

> Is this Zeus specific, or should it also be merged into master and dunfe=
ll?



Good point. I will see into the supported distro's for dunfell and see if =
I
can replicate the issue there.

Note that if the zstd system library is not installed, cmake-native will
build, configured without zstd archive support.

I will come back with the result, if it is preferable to wait for that
result, disregard this patch.


>
> Ross
>
> On Thu, 13 Aug 2020 at 12:52, Leon Woestenberg <leon@sidebranch.com>
> wrote:
> >
> > On Mint 19.2 (based on Ubuntu 18.04.2), if the system library zstd is
> present,
> > the compile fails as follows:
> >
> >
> <...>/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Utilitie=
s/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2:
> > error: unknown type name =E2=80=98ZSTD_DStream=E2=80=99
> > |   ZSTD_DStream *dstream;
> > |   ^
> >
> > cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configu=
re
> | grep -i ZSTD
> > -- Using system-installed ZSTD
> > -- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so
> >
> > grep -rne ZSTD_DStream /usr/include/zstd.h
> > <no output>
> >
> > The fix in this commit is to use the cmake provided zstd library:
> >
> >     -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
> >
> > so that on supported distributions, we do not depend on the system zst=
d
> library (version).
> >
> > Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake-native_3.15.3.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> > index b2952ee..e0ac3f8 100644
> > --- a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> > +++ b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
> > @@ -21,6 +21,7 @@ CMAKE_EXTRACONF =3D "\
> >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
> >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
> >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
> > +    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
> >      -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
> >      -DHAVE_SYS_ACL_H=3D0 \
> >  "
> > --
> > 2.7.4
> >
> >=20
>
--=20
--=20
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--000000000000a2b14f05acd3a541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">On Fri, 14 Aug 2020 at 12:00, Ross Burton &lt;<a hre=
f=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div>=
</div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">Is this Zeus specifi=
c, or should it also be merged into master and dunfell?</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Good poi=
nt. I will see into the supported distro&#39;s for dunfell and see if I can=
 replicate the issue there.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Note that if the zstd system library is not installed, cmake-native wil=
l build, configured without zstd archive support.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I will come back with the result, if it is prefer=
able to wait for that result, disregard this patch.</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><br>
<br>
Ross<br>
<br>
On Thu, 13 Aug 2020 at 12:52, Leon Woestenberg &lt;<a href=3D"mailto:leon@=
sidebranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mint 19.2 (based on Ubuntu 18.04.2), if the system library zstd is=
 present,<br>
&gt; the compile fails as follows:<br>
&gt;<br>
&gt; &lt;...&gt;/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3=
/Utilities/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2:=
<br>
&gt; error: unknown type name =E2=80=98ZSTD_DStream=E2=80=99<br>
&gt; |=C2=A0 =C2=A0ZSTD_DStream *dstream;<br>
&gt; |=C2=A0 =C2=A0^<br>
&gt;<br>
&gt; cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_config=
ure | grep -i ZSTD<br>
&gt; -- Using system-installed ZSTD<br>
&gt; -- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so<br>
&gt;<br>
&gt; grep -rne ZSTD_DStream /usr/include/zstd.h<br>
&gt; &lt;no output&gt;<br>
&gt;<br>
&gt; The fix in this commit is to use the cmake provided zstd library:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \<br>
&gt;<br>
&gt; so that on supported distributions, we do not depend on the system zs=
td library (version).<br>
&gt;<br>
&gt; Signed-off-by: Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebranch=
.com" target=3D"_blank">leon@sidebranch.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.15=
.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15.3.bb</a> | 1 =
+<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-nati=
ve_3.15.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15.3.bb</=
a> b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.15.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15.3.bb</a><br>
&gt; index b2952ee..e0ac3f8 100644<br>
&gt; --- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.15=
.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15.3.bb</a><br>
&gt; +++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.15=
.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15.3.bb</a><br>
&gt; @@ -21,6 +21,7 @@ CMAKE_EXTRACONF =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \<br>
&gt; +=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DHAVE_SYS_ACL_H=3D0 \<br>
&gt;=C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; <br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div style=3D"color:rgb(0,0,0)"><span style=3D"font-family:-webkit-standard=
;font-size:medium">--=C2=A0</span><br><span style=3D"font-family:-webkit-st=
andard;font-size:medium">Leon Woestenberg</span><br><span style=3D"font-fam=
ily:-webkit-standard;font-size:medium"><a href=3D"mailto:leon@sidebranch.co=
m" target=3D"_blank">leon@sidebranch.com</a></span><br><span style=3D"font-=
family:-webkit-standard;font-size:medium">T: +31 40 711 42 76</span><br><sp=
an style=3D"font-family:-webkit-standard;font-size:medium">M: +31 6 472 30 =
372</span><div style=3D"font-family:Helvetica"><img src=3D"http://www.sideb=
ranch.eu/en/images/sidebranch-logo.png" width=3D"96" height=3D"53"><br></di=
v><span style=3D"font-family:-webkit-standard;font-size:medium">Sidebranch<=
/span><font face=3D"Helvetica">=C2=A0</font><span style=3D"font-family:-web=
kit-standard;font-size:medium">Embedded Systems</span><br><span style=3D"fo=
nt-family:-webkit-standard;font-size:medium">Eindhoven, The Netherlands</sp=
an><br><span style=3D"font-family:-webkit-standard;font-size:medium"><a hre=
f=3D"http://www.sidebranch.com" target=3D"_blank">http://www.sidebranch.com=
</a></span><div style=3D"font-family:Helvetica"><br></div></div></div></div=
></div></div>

--000000000000a2b14f05acd3a541--
