Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14940.1794777512951602593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WP0o1WLW;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67dabd38cdfso678186d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 13:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794777512; cv=none;
        d=google.com; s=arc-20260327;
        b=p1JVZQkq4mZLFCStCnroMhoDCeS9afEkIgUgjjsxHxLoOnjPXiAxoyBFZaQjYNWG9f
         urOuWwk3V5gJWTImHaeyOpaXYKfecTSFIqTmnSDAWnmGtpe7CvZpme/+W4QVKCwBM3tX
         5u+u0JbHT0lDJUW0nG946oSwst3YsXZxw0wp+wyh58PzqeYvsuO3bNTtqHGSi5wXn63o
         a/uRE0POWMgjNdpQ0X4oWmGKz0bVYsqiiiH4z/INHaxT96W7kbHdj+ePuoycKwXa0Hyq
         GY/fGrZWl/JhQmMT8OQhqOe9mzK3rcFSvGnIGLJ2PNHpltzJUd2h7sCIL1EHQMtgGuEY
         2UJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yAumhJ3dXJK7XZJG4ciZxtq6X41Eb+VYCVGCvxRVKrE=;
        fh=tqzTG8ULmxT+Fnj66IgbpGqXg8tPqP6jBoTNpGpNm0I=;
        b=fCvguEHmY3tVkJrquCG7geR3APFcMwS9qOlw3cJKaaR3IJ/1y1H8H7xyN6mjlvwmpI
         uU5jMpBYEeMM4wER4zZWQl9YXHn97jTwemGdaQ1kGwdYwkmjAjoAtYSUJazq8xD3WdnM
         S0LG5YBoR5WJaBQ8FCJcgjALNq46hhEymDXpq8O41iluwQXRweN63MUXeVACGigisqLk
         5WosdnxSeZE75Ye9kMbk6dov/zAMhoVOOIn/yHy3BaOrIp6sdZcDrAExYs0MMhqwyreA
         RDTkXLeVRUpCnF7rp/WUGFA3v9E5pXZMTaADwntGiyHsz2rJuJU3eGL6pi8CsLCw0dDX
         oWVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777512; x=1795382312; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAumhJ3dXJK7XZJG4ciZxtq6X41Eb+VYCVGCvxRVKrE=;
        b=WP0o1WLWurgUMWLu2mhs+s/gKIH+l8r+AuuBbT3Oj4uSggpii31/j4wOfyll6zO1kp
         TL3LNMk4THJUAt1woz/haKdPheuYJ/DqhrXlMwJEcV5kzck5LD4GqpJ6i9QSsdYg9hUY
         y6aeUayrHPLGBKKodcxM9V35liHZTgkJGvCVKFtGuEv48URNfZq+SC48BeUsGXE7qHE/
         Qw+ULOkFBmIIGIN05EWdH5Ve4okixaecgufiy0cx6xJRdRAx8QOqiqjZPsk6IQuSlnD3
         HQwhkBQd5Rl/oiiv8rEL0R5Y/4m6Rb3lABpVPl1cA7nyY0971RgwQcLpZM38EK7DEUxf
         80cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777512; x=1795382312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yAumhJ3dXJK7XZJG4ciZxtq6X41Eb+VYCVGCvxRVKrE=;
        b=2Ivo8L1dnshIaZ/p2HJPM/Uadvx7t0wv8hEexnWN7y8hkQY1x3qDLcguB5UdCIEBkj
         lYCIg5cGRyNdixwUqTcAveP89s8aWa2rhTUhV0hEBMnA26ODI8Ja+0knqg90l9jU2OWv
         QclP1+UvEGLmK4ny11Xpe6j+w8jJk6iqmVlq3pFaD9ws6R8yHdJCltdfHlQmU/HGd86t
         wQV3AffZM3EsFoxY3fNM4YLhtCQlYyl5R47+Hm2nkp9avdihHAOF0X2Ifch57Pkyqoez
         iPunUag1kQ+MLwsgRkiUf6OVdC+1SskoYu0QzMCBEkgLj36RqxpSPLcer4x7EkNfASZm
         gb5w==
X-Gm-Message-State: APuU4Z/fPnJp3cbRmBTYRoaqwBY9RV0Oz/RIUMVudrYjOCO/1gPw+jbS
	ihP0u7W2owvKRXlUMIjlofflBdaTBU0b2cCv8yoLKjVcRa7RxkVuQluMp+j28sUhKN70SDiq1vU
	TaEUE/0ibgfpH4M2shUAjdKiPeEdIQFc=
X-Gm-Gg: AYBFou1Vrj/+ztqqC7cfQ+ueIOaGeE0Rdu/6uvWIN8eXn8onYpcc1V2utkg6DE2lj6Q
	C27Rc2fO4qhYtBHfMNm/vxevgRv4nSL5Qa6h71yM0/DpP7qyUhu+FGOpWoUdfl56A8N1NeOby31
	oM5QaESO3/ne1MDvcRx9pUcPKoemBpXa18jFYiTYmjreh7KAOTFc4GlSoGwKuaOzQn+ZD4cKjbG
	jRxDjzgyGMgykLWNB45KNQd180+R2IvJ0Mkno5xMSo2QnSAMdICi27UuBIr1f0H0DdgBR9FZ4rv
	+/7DTxNxeljOKwzSeMCABYIf4BacOHNwpYjQrtK9qUoEB1QuYjyLww4vMuvsFA+x0j3EJySdp/j
	23ILC37mDq8+2h+u+S0KGgssxVFLdG5YGhpiL9zn2LV71AtWoOIqI9DjvnTJwsglBcNuYvOL10m
	odVJ8LlPuHq/HPGzGVU1c3YPuGWLapLZChGfojT5gEsXREItDpWJvF3YTRrCLeh1o3o8fS1sfys
	Lmnt4I4pXmjKy460PjpYPqmct/qyI3kCapSPM04ZSlfuxXB8lAT6e9dE88ztzwHAm6cG1xTYI9N
	os070VTRB/rQY6J5Asj2otGH2CxmsjE3Wk/WH7IcjWyXmW7fsLTaUui4YpH1BoQ=
X-Received: by 2002:a05:690e:a43:b0:67d:b16a:d97f with SMTP id
 956f58d0204a3-67db16add38mr1156575d50.16.1794777511888; Sun, 15 Nov 2026
 13:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20261108204558.3577002-1-khem.raj@oss.qualcomm.com> <ac8ff53e3255be6f3c080bbe56a9968e97ed53eb.camel@linuxfoundation.org>
In-Reply-To: <ac8ff53e3255be6f3c080bbe56a9968e97ed53eb.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Nov 2026 13:18:04 -0800
X-Gm-Features: AclHuK9g-i4Cq_JALYYqNvAFucgl6mWtQ1S_5k5rCjOJDIN-48aYaSsLcwuVX7M
Message-ID: <CAMKF1sq2LyGCBRXOWBvaDio5EWmcEziM_9NazcOwH7uOLEQs9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] packagegroups: Add clang to the SDK
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>, Sunil Dora <sunilkumar.dora@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000000c0d5f06605734cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250281

--0000000000000c0d5f06605734cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:25=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2026-11-08 at 12:45 -0800, Khem Raj via openembedded-core wrote:
> > diff --git a/meta/recipes-core/packagegroups/
> packagegroup-clang-cross-canadian.bb b/meta/recipes-core/packagegroups/
> packagegroup-clang-cross-canadian.bb
> > new file mode 100644
> > index 0000000000..a1d7445b71
> > --- /dev/null
> > +++ b/meta/recipes-core/packagegroups/
> packagegroup-clang-cross-canadian.bb
> > @@ -0,0 +1,11 @@
> > +SUMMARY =3D "Host SDK package for clang cross canadian toolchain"
> > +
> > +include recipes-core/packagegroups/packagegroup-cross-canadian.bb
> > +
> > +PN =3D "packagegroup-clang-cross-canadian-${MACHINE}"
> > +
> > +CLANG =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > +
> > +RDEPENDS:${PN} +=3D "\
> > +    ${@oe.utils.all_multilib_tune_values(d, 'CLANG')} \
> > +"
>
> Reviewing this, I did end up wondering if we really need cross-canadian
> for clang?
>
> Unlike gcc/gdb/binutils, a single clang binary supports all the targets
> and the -cross-canadian pieces are just symlink farms. Do we need them
> at all or could just just point at "clang" everywhere without the
> triplets?
>
> I'm wondering if we can simplify in this case rather than perpetuating
> that complexity...
>

I also wish the same, for that we have to change how we package varous gcc
toolchains too
SDK environment script expect ${TARGET_PREFIX}clang in the same place as
the GCC tools.
It also needs to packagegroup-cross-canadian-${MACHINE}, so clang needs a
package of that shape to be pulled in.
the symlinks also do an interesting work of passing right --target to clang
which has to be passed externally
otherwise. As such it makes is like a gcc based cross-compiler from usage
point of view, which is
also ease of use advantage.

>
> Cheers,
>
> Richard
>

--0000000000000c0d5f06605734cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12,=
 2026 at 5:25=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2026-11-08=
 at 12:45 -0800, Khem Raj via openembedded-core wrote:<br>
&gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://package=
group-clang-cross-canadian.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-clang-cross-canadian.bb</a> b/meta/recipes-core/packagegroups/<a href=
=3D"http://packagegroup-clang-cross-canadian.bb" rel=3D"noreferrer" target=
=3D"_blank">packagegroup-clang-cross-canadian.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a1d7445b71<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-c=
lang-cross-canadian.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-c=
lang-cross-canadian.bb</a><br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +SUMMARY =3D &quot;Host SDK package for clang cross canadian toolchain=
&quot;<br>
&gt; +<br>
&gt; +include recipes-core/packagegroups/<a href=3D"http://packagegroup-cro=
ss-canadian.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-cross-can=
adian.bb</a><br>
&gt; +<br>
&gt; +PN =3D &quot;packagegroup-clang-cross-canadian-${MACHINE}&quot;<br>
&gt; +<br>
&gt; +CLANG =3D &quot;clang-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;<=
br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0=C2=A0=C2=A0 ${@oe.utils.all_multilib_tune_values(d, &#39;CLANG=
&#39;)} \<br>
&gt; +&quot;<br>
<br>
Reviewing this, I did end up wondering if we really need cross-canadian<br>
for clang?<br>
<br>
Unlike gcc/gdb/binutils, a single clang binary supports all the targets<br>
and the -cross-canadian pieces are just symlink farms. Do we need them<br>
at all or could just just point at &quot;clang&quot; everywhere without the=
<br>
triplets?<br>
<br>
I&#39;m wondering if we can simplify in this case rather than perpetuating<=
br>
that complexity...<br></blockquote><div><br></div><div>I also wish the same=
,=C2=A0for that we have to change how we=C2=A0package varous=C2=A0gcc toolc=
hains too</div><div>SDK environment script expect <code dir=3D"ltr">${TARGE=
T_PREFIX}clang</code> in the same place as the GCC tools.</div><div><code d=
ir=3D"ltr"><font face=3D"Arial, Helvetica, sans-serif">It also needs to p</=
font>ackagegroup-cross-canadian-${MACHINE}</code>, so clang needs a package=
 of that shape to be pulled in.</div><div>the symlinks also do an interesti=
ng=C2=A0work of passing right --target to clang which has to be passed exte=
rnally</div><div>otherwise. As such it makes is like a gcc based cross-comp=
iler from usage point of view, which is</div><div>also ease of use advantag=
e.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000000c0d5f06605734cf--
