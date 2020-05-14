Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.2253.1589494115012977268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 15:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=TmaX6NOI;
 spf=neutral (domain: kynetics.com, ip: 209.85.208.65, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ed1-f65.google.com with SMTP id bs4so242017edb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92FTLh6DAnoBLkYts/fd2lM/9R5xAUP1zCDF6swdiC8=;
        b=TmaX6NOIA31RgE4rdPEbab+eERkkijBTBZ3LDY7JI/WXYH+MsQZuvvzefqH92YfIqN
         yiPNf8Xe8VX63xDxS9jw6bqBfNghj0NyytJGtkgFhQlXQs9wY5gKhe76jzJxJqtvjXx/
         6EdGw9V4zQDQG4FLnKyxZOEW+2yBC9JDvHnaTy4mRvbFcG+3ARU7KjL6QZoBJ1GH36NU
         0XCj7ciKz6POS47Su7gZmxNy/sYMKXF7Fiwqebx/2eJgB4Hz5mezv82pKuDaR3TjuDk1
         e7zBUMtZN5y0ncqwbCOpWsXk9+6ICDjgvE85fJDNVvKPyqpmQyLX+WLjHJ/wBLmkNHfw
         jcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92FTLh6DAnoBLkYts/fd2lM/9R5xAUP1zCDF6swdiC8=;
        b=O3IAaI6KUtfXxmEuavulTIk2HQGM6ziNzhaiO5hGUPC83IFl7ZrLbJOw2kg8Km4xrL
         0nNv05PoqT+IoKtnHih/92D+yBtMoDudV/rom7IjpDHE55EIHLTxvwnzIMBkv+wFw1jy
         5g7vJ7VEuxeDFXvC3M0iNgeIVr/fTty3h1c53HVXXoSsc/KSRaW6CAa4H/SvBXJuANaB
         hw3a14IW8mCVA6lDP6YLshvThRe6X3EVq7Cpb39jCiKjai+90nbwQyefSKlJInkKkEfM
         Y5UNCl3qAP52EJDMyR13ANicp+xJOvfy+Idwae5wVlNUlWI5zlU+JKGvHr24uCr0Rsaz
         YOcQ==
X-Gm-Message-State: AOAM533cHnbfaf5STXDCYVIOV05zhG9bECPIqA/l/fMq40JCyXoYSyaB
	s/cRHowRm7rdlbZpeiEih4aWm0sle2aMEkQISc7Tcg==
X-Google-Smtp-Source: ABdhPJyYCVkYzdFvu4t8vQzB1H1VqjjDZXnTVnpNhLcgHKaklhExP94RbuiI7EDUMhObk/5A0ahudo7FrlghvM8APb8=
X-Received: by 2002:a50:ccc5:: with SMTP id b5mr197568edj.340.1589494113419;
 Thu, 14 May 2020 15:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131956.18463-1-diego.rondini@kynetics.com>
 <46e7dbc17ee0237529c6ae3d3f5162aa16105cd0.camel@linuxfoundation.org>
 <CAMfw5YopZDvTBsL=zVKGTLPv5uvfmJ0L7j+y0r9PpO7drYwKMQ@mail.gmail.com> <a040ae6cce408cb4dfaa7f302679d426b65e66c1.camel@linuxfoundation.org>
In-Reply-To: <a040ae6cce408cb4dfaa7f302679d426b65e66c1.camel@linuxfoundation.org>
From: "Diego" <diego.rondini@kynetics.com>
Date: Fri, 15 May 2020 00:08:22 +0200
Message-ID: <CAMfw5YpdYGHD1pvZixbNbRRY8T7wWuLWPVJOTJuw3wCUBN6n8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: declare support for wic.zst
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000f1b505a5a2f067"

--00000000000000f1b505a5a2f067
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Thu, May 14, 2020 at 11:59 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-05-14 at 23:53 +0200, Diego Rondini wrote:
> > Hi Richard,
> >
> > On Thu, May 14, 2020 at 11:21 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2020-05-14 at 15:19 +0200, Diego wrote:
> > > > Declare images in wic.zst format as supported, as bmaptool now
> supports
> > > > zstd:
> > > >
> https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
> > > > Given the very fast decompression speed of zstd over, for example,
> gzip,
> > > > writing images with bmaptool can provide big write speed improvements
> > > > when decompression speed is the limiting factor (especially with very
> > > > sparse images).
> > > >
> > > > Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > > > ---
> > > >  meta/classes/image_types.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> > > > index f82f1d8862..ab05cc90ff 100644
> > > > --- a/meta/classes/image_types.bbclass
> > > > +++ b/meta/classes/image_types.bbclass
> > > > @@ -273,7 +273,7 @@ IMAGE_TYPES = " \
> > > >      ubi ubifs multiubi \
> > > >      tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
> > > >      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> > > > -    wic wic.gz wic.bz2 wic.lzma \
> > > > +    wic wic.gz wic.bz2 wic.lzma wic.zst \
> > > >      container \
> > > >      f2fs \
> > > >  "
> > >
> > > Causes selftest failures:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/931
> > >
> > > (oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)
> > >
> >
> > I'm wondering how this didn't pop up earlier. The following patch
> introduced zstd support:
> >
> http://git.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass?id=77e0f502020085875bbc74da66815c89f19a9351
> > of course specifying a DEPENDS on zstd-native:
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/image_types.bbclass?h=yocto-3.1#n316
> > but... zstd is NOT in oe-core, but in meta-oe!
> > http://layers.openembedded.org/layerindex/recipe/116635/
> >
> > I guess the solution for master is to move zstd to oe-core, right?
> >
> > But what about dunfell? It has the zstd support in image_types.bbclass
> patch, but we can't add zstd. Shall we revert the patch?
>
> I think:
>
> meta/lib/oeqa/selftest/cases/imagefeatures.py:        blacklist =
> set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst'))
>
> may be the clue to fixing this.
>

Ah, ok, so it is legit to support a compression format not available in
oe-core itself.

I'll resend the patch with the test disabled then.


> Cheers,
>
> Richard
>
>

Regards,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

--00000000000000f1b505a5a2f067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi Richard,<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2020=
 at 11:59 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2020-05-14 at 23:53 +0=
200, Diego Rondini wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; On Thu, May 14, 2020 at 11:21 PM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2020-05-14 at 15:19 +0200, Diego wrote:<br>
&gt; &gt; &gt; Declare images in wic.zst format as supported, as bmaptool n=
ow supports<br>
&gt; &gt; &gt; zstd:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/intel/bmap-tools/commit/1b8437=
d58447d3796dc11fd0f2c62bec5746e5d6" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec57=
46e5d6</a><br>
&gt; &gt; &gt; Given the very fast decompression speed of zstd over, for ex=
ample, gzip,<br>
&gt; &gt; &gt; writing images with bmaptool can provide big write speed imp=
rovements<br>
&gt; &gt; &gt; when decompression speed is the limiting factor (especially =
with very<br>
&gt; &gt; &gt; sparse images).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.ron=
dini@kynetics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/classes/image_types.bbclass | 2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/classes/image_types.bbclass b/meta/classes=
/image_types.bbclass<br>
&gt; &gt; &gt; index f82f1d8862..ab05cc90ff 100644<br>
&gt; &gt; &gt; --- a/meta/classes/image_types.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/image_types.bbclass<br>
&gt; &gt; &gt; @@ -273,7 +273,7 @@ IMAGE_TYPES =3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ubi ubifs multiubi \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zs=
t \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 =
\<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 wic wic.gz wic.bz2 wic.lzma \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 wic wic.gz wic.bz2 wic.lzma wic.zst \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 container \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 f2fs \<br>
&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; <br>
&gt; &gt; Causes selftest failures:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/87/builds/931" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/typhoon/#/builders/87/builds/931</a><br>
&gt; &gt; <br>
&gt; &gt; (oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)<b=
r>
&gt; &gt; <br>
&gt; <br>
&gt; I&#39;m wondering how this didn&#39;t pop up earlier. The following pa=
tch introduced zstd support:<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core/commit/meta/c=
lasses/image_types.bbclass?id=3D77e0f502020085875bbc74da66815c89f19a9351" r=
el=3D"noreferrer" target=3D"_blank">http://git.openembedded.org/openembedde=
d-core/commit/meta/classes/image_types.bbclass?id=3D77e0f502020085875bbc74d=
a66815c89f19a9351</a><br>
&gt; of course specifying a DEPENDS on zstd-native:<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/image_types.bbclass?h=3Dyocto-3.1#n316" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/openembedded-core/tree/meta/classes/imag=
e_types.bbclass?h=3Dyocto-3.1#n316</a><br>
&gt; but... zstd is NOT in oe-core, but in meta-oe!<br>
&gt; <a href=3D"http://layers.openembedded.org/layerindex/recipe/116635/" r=
el=3D"noreferrer" target=3D"_blank">http://layers.openembedded.org/layerind=
ex/recipe/116635/</a><br>
&gt; <br>
&gt; I guess the solution for master is to move zstd to oe-core, right?<br>
&gt; <br>
&gt; But what about dunfell? It has the zstd support in image_types.bbclass=
 patch, but we can&#39;t add zstd. Shall we revert the patch?<br>
<br>
I think:<br>
<br>
meta/lib/oeqa/selftest/cases/imagefeatures.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
lacklist =3D set((&#39;container&#39;, &#39;elf&#39;, &#39;f2fs&#39;, &#39;=
multiubi&#39;, &#39;tar.zst&#39;))<br>
<br>
may be the clue to fixing this.<br></blockquote><div><br></div><div>Ah, ok,=
 so it is legit to support a compression format not available in oe-core it=
self.</div><div><br></div><div>I&#39;ll resend the patch with the test disa=
bled then.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><br></div>Regards,<br><div><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Diego Rondini<br>Sr. Embed=
ded Engineer<br><br>Kynetics<br><a href=3D"http://www.kynetics.com" target=
=3D"_blank">www.kynetics.com</a><br></div></div></div></div>

--00000000000000f1b505a5a2f067--
